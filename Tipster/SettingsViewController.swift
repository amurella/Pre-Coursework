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
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        let defaults = NSUserDefaults.standardUserDefaults()
        var tipValue = defaults.integerForKey("tipValue")
        //  println("got default tip: \(tipValue)")
        switch tipValue {
        case 0...2:
            defaultSegUI.selectedSegmentIndex = tipValue
        default:
            defaultSegUI.selectedSegmentIndex = 0
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
