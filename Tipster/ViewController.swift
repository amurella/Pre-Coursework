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
    @IBOutlet weak var splitBy: UITextField!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var splitLabel: UILabel!
    @IBOutlet weak var viewColor: UIView!
    @IBOutlet var colorBack: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tipLabel.text = "$0.00"
        totalLabel.text = "$0.00"
        splitLabel.text = "$0.00"
        billField.becomeFirstResponder()
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
        var billAmount = NSString(string: billField.text!).doubleValue
        var splitNumber = NSString(string: splitBy.text!).doubleValue
        var tip = billAmount * tipPercentage
        var total = billAmount + tip
        if(splitNumber == 0) {
            splitNumber = 1
        }
        var split = total / splitNumber
        
        tipLabel.text = "$\(tip)"
        totalLabel.text = "$\(total)"
        splitLabel.text = "$\(split)"
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
        splitLabel.text = String(format: "$%.2f", split)
        
        fadeIn()
    }
    
    func fadeIn() {
        self.totalLabel.alpha = 0
        self.splitLabel.alpha = 0
        UIView.animateWithDuration(0.4,
            animations: {
                self.totalLabel.alpha = 1
                self.splitLabel.alpha = 1
            })
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        let defaults = NSUserDefaults.standardUserDefaults()
        var tipValue = defaults.integerForKey("tipValue")
        switch tipValue {
        case 0...2:
            tipControl.selectedSegmentIndex = tipValue
        default:
            tipControl.selectedSegmentIndex = 0
        }
        
        // Recalculate the tip
        updateValue()
        fadeIn()
        
        let defaultColor = NSUserDefaults.standardUserDefaults()
        var color = defaultColor.integerForKey("color")
        
        if(color == 0) {
            colorBack.backgroundColor = UIColor.whiteColor()
        }
        if(color == 1) {
            colorBack.backgroundColor = UIColor.grayColor()
        }
        if(color == 2) {
            colorBack.backgroundColor = UIColor.magentaColor()
        }
        if(color == 3){
            colorBack.backgroundColor = UIColor.blueColor()
        }
    }
    
    


    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }
}

