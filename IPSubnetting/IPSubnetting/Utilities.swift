//
//  Utilities.swift
//  IPSubnetting
//
//  Created by Allan Anderson on 2015-Jan-13.
//  Copyright (c) 2015 Allan Anderson. All rights reserved.
//

import Foundation

// MARK: - DecimalToBinary
func decimalToBinary(_ base10:Int)->String{
    var base10 = base10
    var remainder = 0
    var binary:String = ""
    while (base10 != 0){
        remainder = base10 % 2
        base10 = base10 / 2
        binary = "\(remainder)" + binary
    }
    return binary
}

// MARK: - DecimalToHex
func decimalToHex(_ base10:Int)->String{
    var base10 = base10
    var remainder = 0
    var remainderString = ""
    var hex = ""
    while (base10 != 0){
        remainder = base10 % 16
        switch(remainder){
        case 10:
            remainderString = "A"
        case 11:
            remainderString = "B"
        case 12:
            remainderString = "C"
        case 13:
            remainderString = "D"
        case 14:
            remainderString = "E"
        case 15:
            remainderString = "F"
        default:
            remainderString = "\(remainder)"
        }
        hex = remainderString + hex
        base10 /= 16
    }
    return hex
}
// MARK: - BinarytoDecimal
func binaryToDecimal(_ binary:String)->Int{
    var digit:Int
    var subTotal = 0
    for letter in binary{
        //print(letter)
        digit = Int(String(letter))!
        subTotal = subTotal * 2 + digit
    }
    return subTotal
}
// MARK: - HexToDecimal
func hexToDecimal(_ hex:String)->Int{
    var digitString:String
    var digit:Int
    var subTotal = 0
    for letter in hex{
        digitString = String(letter)
        switch(digitString){
        case "A":
            digit = 10
        case "B":
            digit = 11
        case "C":
            digit = 12
        case "D":
            digit = 13
        case "E":
            digit = 14
        case "F":
            digit = 15
        default:
            digit = Int(digitString)!
        }
        subTotal = subTotal * 16 + digit
    }
    return subTotal
}

// MARK: - PadZeros
func padZeros(_ binString:String, numZeros size:Int)->String{
    var binString = binString
    while(binString.count < size){
        binString = "0" + binString
    }
    return binString
}
func padRight(_ binString:String, numZeros size:Int)->String{
    var binString = binString
    while(binString.count < size){
        binString = binString + "0"
    }
    return binString
}
// MARK: - PadSpaces

// MARK: - InvertBits
func invertBits(_ binString:String)->String{
    var inverted:String = ""
    for digit in binString{
        if (digit == "0"){
            inverted = inverted + "1"
        } else {
            inverted = inverted + "0"
        }
    }
    return inverted
}
// MARK: - BitwiseAnd
func bitwiseAND(_ bin1:String, andMask bin2:String)->String{
    var andString = ""
    let binDigits1 = Array(bin1)
    let binDigits2 = Array(bin2)
    for i in 0..<bin1.count{
        if binDigits1[i] == binDigits2[i]{
            andString = andString + "\(binDigits1[i])"
        } else {
            andString = andString + "0"
        }
    }
    return andString
}
// MARK: - BitwiseOr
func bitwiseOR(_ bin1:String, andMask bin2:String)->String{
    var orString = ""
    let binDigits1 = Array(bin1)
    let binDigits2 = Array(bin2)
    for i in 0..<bin1.count{
        if binDigits1[i] == "1" || binDigits2[i] == "1"{
            orString = orString + "1"
        } else {
            orString = orString + "0"
        }
    }
    return orString
}

// MARK: - CountOnes
func countOnes(_ binString:String)->Int{
    var count = 0
    for digit in binString{
        if digit == "1"{
            count = count + 1
        }
    }
    return count
}

// MARK: - FormatBinaryString
func formatBinaryString(_ binString:String)->String{
    var binString = binString
    var binary:String = ""
    var octet:String
    while (binString.count) > 0{
        let index = binString.index(binString.startIndex, offsetBy: 8)
        octet = binString.substring(to: index)
        binary = binary + octet + " "
        binString = binString.substring(from: index)
    }
    //binary = binary.substringToIndex(advance(binary.startIndex, binary.characters.count - 1))
    let binIndex = binary.index(binary.startIndex, offsetBy: (binary.count) - 1)
    binary = binary.substring(to: binIndex)
    return binary
}

