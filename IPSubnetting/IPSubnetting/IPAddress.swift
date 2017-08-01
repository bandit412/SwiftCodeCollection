//
//  IPAddress.swift
//  IPSubnetting
//
//  Created by Allan Anderson on 2015-Jan-13.
//  Copyright (c) 2015 Allan Anderson. All rights reserved.
//

import Foundation
class IPAddress {
    var octet1:Int
    var octet2:Int
    var octet3:Int
    var octet4:Int
    var cidr: Int
    var ipString:String = ""
    var maskString:String = ""
    var subnetMask:String = ""
    
    init(){
        octet1 = 1
        octet2 = 0
        octet3 = 0
        octet4 = 0
        cidr = 1
        ipString = createIPString()
        maskString = createMaskString()
        subnetMask = createSubnetMask()
    }
    
    // MARK: - CreateIPString
    func createIPString()->String{
        return padZeros(decimalToBinary(octet1), numZeros: 8) + padZeros(decimalToBinary(octet2), numZeros: 8) + padZeros(decimalToBinary(octet3), numZeros: 8) + padZeros(decimalToBinary(octet4), numZeros: 8)
    }
    
    // MARK: - CreateIPString
    func createMaskString()->String{
        var mask = ""
        for _ in 1 ... cidr{
            mask = mask + "1"
        }
        mask = padRight(mask, numZeros: 32)
        return mask
    }
    
    // MARK: - CreateSubnetMask
    func createSubnetMask()->String{
        var subnet = ""
        var mask = maskString
        var octet:String
        var base10:Int
        while (mask.characters.count) > 0{
            //octet = mask.substring(to: advance(mask.startIndex, 8))
            let index = mask.index(mask.startIndex, offsetBy: 8)
            octet = mask.substring(to: index)
            base10 = binaryToDecimal(octet)
            subnet = subnet + "\(padZeros(String(base10), numZeros: 3))."
            mask = mask.substring(from: index)
        }
        //subnet = subnet.substringToIndex(advance(subnet.startIndex,(subnet.characters.count) - 1))
        let subIndex = subnet.index(subnet.startIndex, offsetBy: (subnet.characters.count) - 1)
        subnet = subnet.substring(to: subIndex)
        return subnet
    }
    
    // MARK: - CreateDottedIP
    func createDottedIP(_ binaryString:String)->String{
        var binaryString = binaryString
        var subnet = ""
        var octet:String
        var base10:Int
        while (binaryString.characters.count) > 0{
            //octet = binaryString.substring(to: advance(binaryString.startIndex, 8))
            let index = binaryString.index(binaryString.startIndex, offsetBy: 8)
            octet = binaryString.substring(to: index)
            base10 = binaryToDecimal(octet)
            subnet = subnet + "\(padZeros(String(base10), numZeros: 3))."
            binaryString = binaryString.substring(from: index)
        }
        //subnet = subnet.substringToIndex(advance(subnet.startIndex,(subnet.characters.count) - 1))
        let subIndex = subnet.index(subnet.startIndex, offsetBy: (subnet.characters.count) - 1)
        subnet = subnet.substring(to: subIndex)
        return subnet
    }
    
    // MARK: - NetworkID
    func networkID()->String{
        return bitwiseAND(ipString, andMask: maskString)
    }
    
    // MARK: - BroadcastID
    func broadcastID()->String{
        return bitwiseOR(ipString, andMask: invertBits(maskString))
    }
    
    // MARK: - NetworkHosts
    func networkHosts()->Int{
        let ones = 32 - cidr
        return Int(pow(2, Double(ones)) - 2)
    }
    
    // MARK: - TotalSubnets
    func totalSubnets()->Int{
        //var lastOctets = ipString.substring(from: advance(ipString.startIndex, 16))
        let lastOctets = ipString.substring(from: ipString.index(ipString.startIndex, offsetBy: 16))
        let ones = countOnes(lastOctets)
        return Int(pow(2, Double(ones)))
    }
    
    // MARK: - NetworkClass
    func networkClass()->String{
        var netClass:String
        if octet1 <= 126{
            netClass = "A"
        } else if octet1 == 127 || octet1 == 0{
            netClass = "Loopback & diagnostics"
        } else  if octet1 <= 191{
            netClass = "B"
        } else if octet1 <= 223{
            netClass = "C"
        } else if octet1 <= 239 {
            netClass = "D"
        } else {
            netClass = "E"
        }
        // now check for PRIVATE networks
        if (octet1 == 10) || (octet1 == 172 && octet2 >= 16 && octet2 <= 31) || (octet1 == 192 && octet2 == 168) {
            netClass += ": Private"
        }
        return netClass
    }
    
}
