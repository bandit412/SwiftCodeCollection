//
//  FirstViewController.swift
//  IPSubnetting
//
//  Created by Allan Anderson on 2015-Jan-13.
//  Copyright (c) 2015 Allan Anderson. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    var ipAddress = IPAddress()
    
    @IBOutlet var tbOctet1: UITextField!
    @IBOutlet var tbOctet2: UITextField!
    @IBOutlet var tbOctet3: UITextField!
    @IBOutlet var tbOctet4: UITextField!
    @IBOutlet var tbCIDR: UITextField!
    @IBOutlet var lblMaskString: UILabel!
    @IBOutlet var lblIpAddress: UILabel!
    @IBOutlet var lblSubnetMask: UILabel!
    @IBOutlet var lblNetworkID: UILabel!
    @IBOutlet var lblNetworkIP: UILabel!
    @IBOutlet var lblBroadcastID: UILabel!
    @IBOutlet var lblBroadcastIP: UILabel!
    @IBOutlet var lblNetworkHosts: UILabel!
    @IBOutlet var lblTotalSubnets: UILabel!
    @IBOutlet var lblSubnetHosts: UILabel!
    @IBOutlet var lblNetworkClass: UILabel!
    @IBAction func tfOctet1(_ sender: UITextField) {
        sender.resignFirstResponder()
    }
    @IBAction func tfOctet2(_ sender: UITextField) {
        sender.resignFirstResponder()
    }
    @IBAction func tfOctet3(_ sender: UITextField) {
        sender.resignFirstResponder()
    }
    @IBAction func tfOctet4(_ sender: UITextField) {
        sender.resignFirstResponder()
    }
    @IBAction func tfCidr(_ sender: UITextField) {
        sender.resignFirstResponder()
    }
    @IBAction func btnCalculate(_ sender: UIButton) {
        var alertMsg: String = ""
        let newCidr = Int(tbCIDR.text!)
        let newOctet1 = Int(tbOctet1.text!)
        let newOctet2 = Int(tbOctet2.text!)
        let newOctet3 = Int(tbOctet3.text!)
        let newOctet4 = Int(tbOctet4.text!)
        // resign any textfield first responder
        sender.resignFirstResponder()

        if newOctet1! >= 1 && newOctet1! < 255 && newOctet2! >= 0 && newOctet2! < 255 && newOctet3! >= 0 && newOctet3! < 255 && newOctet4! >= 0 && newOctet4! < 255{
            ipAddress.octet1 = newOctet1!
            ipAddress.octet2 = newOctet2!
            ipAddress.octet3 = newOctet3!
            ipAddress.octet4 = newOctet4!
            ipAddress.ipString = ipAddress.createIPString()
        } else {
            alertMsg += "Invalid IPv4 Octet(s)!\n"
        }
        if newCidr! > 0 && newCidr! <= 32{
            ipAddress.cidr = newCidr!
            ipAddress.maskString = ipAddress.createMaskString()
            ipAddress.subnetMask = ipAddress.createSubnetMask()
        } else {
            alertMsg += "Invlaid CIDR number!"
        }
        if (alertMsg.count) == 0 {
            updateLabels()
        } else {
            // popup alert for error messages
            let alert = UIAlertController(title: "IPv4 Address Error!", message: alertMsg, preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
            present(alert, animated: true, completion: nil)
        }
    }
    
    @IBAction func btnReset(_ sender: UIButton) {
        ipAddress = IPAddress()
        tbOctet1.text = String(ipAddress.octet1)
        tbOctet2.text = String(ipAddress.octet2)
        tbOctet3.text = String(ipAddress.octet3)
        tbOctet4.text = String(ipAddress.octet4)
        tbCIDR.text = String(ipAddress.cidr)
        updateLabels()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tbOctet1.text = "\(ipAddress.octet1)"
        tbOctet2.text = "\(ipAddress.octet2)"
        tbOctet3.text = "\(ipAddress.octet3)"
        tbOctet4.text = "\(ipAddress.octet4)"
        tbCIDR.text = "\(ipAddress.cidr)"
        updateLabels()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func updateLabels(){
        let formatter = NumberFormatter()
        formatter.numberStyle = NumberFormatter.Style.decimal
        formatter.locale = Locale(identifier: "en_US")
        let netID = ipAddress.networkID()
        let broadID = ipAddress.broadcastID()
        let networkHosts = ipAddress.networkHosts()
        let totalSubnets = ipAddress.totalSubnets()
        let totalHosts = networkHosts * totalSubnets
        lblIpAddress.text = formatBinaryString(ipAddress.ipString)
        lblSubnetMask.text = ipAddress.subnetMask
        lblMaskString.text = formatBinaryString(ipAddress.maskString)
        lblNetworkID.text = formatBinaryString(netID)
        lblNetworkIP.text = ipAddress.createDottedIP(netID)
        lblBroadcastID.text = formatBinaryString(broadID)
        lblBroadcastIP.text = ipAddress.createDottedIP(broadID)
        lblNetworkHosts.text = formatter.string(from: networkHosts as NSNumber)
        lblTotalSubnets.text = formatter.string(from: totalSubnets as NSNumber)
        lblSubnetHosts.text = formatter.string(from: totalHosts as NSNumber)
        lblNetworkClass.text = ipAddress.networkClass()
    }

}

