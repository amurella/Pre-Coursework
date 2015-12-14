//
//  SettingsViewController.swift
//  Tipster
//
//  Created by amurell1 on 12/10/15.
//  Copyright (c) 2015 amurell1. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    
    @IBOutlet weak var defaultLabel: UILabel!
    @IBOutlet weak var defaultSegUI: UISegmentedControl!
    @IBOutlet weak var colorSegUI: UISegmentedControl!
    @IBOutlet var viewColor: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func pickDefault(sender: AnyObject) {
        var tipPercentages = [18,20,22]
        var tipPercentage = tipPercentages[defaultSegUI.selectedSegmentIndex]
        defaultLabel.text = "Default Tip: \(tipPercentage)%"
        
        let defaults = NSUserDefaults.standardUserDefaults()
        defaults.setInteger(sender.selectedSegmentIndex, forKey: "tipValue")
        defaults.synchronize()
        
    }
    
    func updateColor()
    {
        let defaultColor = NSUserDefaults.standardUserDefaults()
        var color = defaultColor.integerForKey("color")
        switch color{
        case 0...3:
            colorSegUI.selectedSegmentIndex = color
        default:
            colorSegUI.selectedSegmentIndex = 0
        }
        
        if(colorSegUI.selectedSegmentIndex == 0) {
            viewColor.backgroundColor = UIColor.whiteColor()
        }
        if(colorSegUI.selectedSegmentIndex == 1) {
            viewColor.backgroundColor = UIColor.grayColor()
        }
        if(colorSegUI.selectedSegmentIndex == 2) {
            viewColor.backgroundColor = UIColor.magentaColor()
        }
        if(colorSegUI.selectedSegmentIndex == 3){
            viewColor.backgroundColor = UIColor.blueColor()
        }

    }
    @IBAction func pickColor(sender: AnyObject) {
        let defaultColor = NSUserDefaults.standardUserDefaults()
        defaultColor.setInteger(sender.selectedSegmentIndex, forKey: "color")
        defaultColor.synchronize()
        updateColor()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        let defaults = NSUserDefaults.standardUserDefaults()
        var tipValue = defaults.integerForKey("tipValue")
        switch tipValue {
        case 0...2:
            defaultSegUI.selectedSegmentIndex = tipValue
        default:
            defaultSegUI.selectedSegmentIndex = 0
        }
        
        let defaultColor = NSUserDefaults.standardUserDefaults()
        updateColor()
    }
    
}
