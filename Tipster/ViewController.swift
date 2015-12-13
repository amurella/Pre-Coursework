//
//  ViewController.swift
//  Tipster
//
//  Created by amurell1 on 12/10/15.
//  Copyright (c) 2015 amurell1. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var totalLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tipLabel.text = "$0.00"
        totalLabel.text = "$0.00"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func onEditingChanged(sender: AnyObject) {
        updateValue()
    }
    
    func updateValue()
    {
        var tipPercentages = [0.18, 0.2, 0.22]
        var tipPercentage = tipPercentages[tipControl.selectedSegmentIndex]
        //var billAmount = billField.text._bridgeToObjectiveC().doubleValue
        var billAmount = NSString(string: billField.text!).doubleValue
        var tip = billAmount * tipPercentage
        var total = billAmount + tip
        
        tipLabel.text = "$\(tip)"
        totalLabel.text = "$\(total)"
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        let defaults = NSUserDefaults.standardUserDefaults()
        var tipValue = defaults.integerForKey("tipValue")
        // println("got default tip: \(tipValue)")
        switch tipValue {
        case 0...2:
            tipControl.selectedSegmentIndex = tipValue
        default:
            tipControl.selectedSegmentIndex = 0
        }
        
        // Recalculate the tip
        updateValue()
        
    }


    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }
}

