//
//  ViewController.swift
//  Tips
//
//  Created by brbailey on 1/2/15.
//  Copyright (c) 2015 brbailey. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var tipPercentLabel: UILabel!
    // Split Bill tip labels
    @IBOutlet weak var twoWayLabel: UILabel!
    @IBOutlet weak var threeWayLabel: UILabel!
    @IBOutlet weak var fourWayLabel: UILabel!
    // Static text labels, left side of screen
    @IBOutlet weak var totalStaticLabel: UILabel!
    @IBOutlet weak var twoWayStaticLabel: UILabel!
    @IBOutlet weak var threeWayStaticLabel: UILabel!
    @IBOutlet weak var fourWayStaticLabel: UILabel!
    @IBOutlet weak var splitBillLabel: UILabel!
    @IBOutlet weak var horzRule: UIView!
    @IBOutlet weak var dunny: UISegmentedControl!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tipLabel.text = "$0.00"
        totalLabel.text = "$0.00"
        tipPercentLabel.text = "Tip"
        
        // initial state of animation
        // stretch billField to full screen
        // ref http://stackoverflow.com/questions/5361369/uiview-frame-bounds-and-center
        self.billField.frame = CGRect(x: 0, y: 0, width: 320, height: 568)
        
        // hide elements with alpha = 0 on load
        self.tipControl.alpha = 0
        self.tipLabel.alpha = 0
        self.tipPercentLabel.alpha = 0
        self.totalLabel.alpha = 0
        self.twoWayLabel.alpha = 0
        self.threeWayLabel.alpha = 0
        self.fourWayLabel.alpha = 0
        self.totalStaticLabel.alpha = 0
        self.twoWayStaticLabel.alpha = 0
        self.threeWayStaticLabel.alpha = 0
        self.fourWayStaticLabel.alpha = 0
        self.splitBillLabel.alpha = 0
        self.horzRule.alpha = 0
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onEditingChanged(sender: AnyObject) {
        var tipPercentages = [0.18, 0.2, 0.22]
        var tipPercentage = tipPercentages[tipControl.selectedSegmentIndex]
        
        var billAmount = NSString(string: billField.text).doubleValue
        var tip = billAmount * tipPercentage
        var total = billAmount + tip
        
        var splitTwo = total / 2
        var splitThree = total / 3
        var splitFour = total / 4
        var showTip = tipPercentage * 100
        
        tipLabel.text = "$\(tip)"
        totalLabel.text = "$\(total)"
        tipPercentLabel.text = "Tip \(showTip)%"
        
        // formatting
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
    
        twoWayLabel.text = String(format: "$%.2f", splitTwo) // f is for fixed-decimal numbers
        threeWayLabel.text = String(format: "$%.2f", splitThree)
        fourWayLabel.text = String(format: "$%.2f", splitFour)
        tipPercentLabel.text = String(format: "%g percent tip", showTip) // g is for general numbers
        
        // animation
        UIView.animateWithDuration(0.5, animations: {
            // collapse box from full screen to top region
            self.billField.frame = CGRect(x: 0, y: 0, width: 320, height: 125)
            })
        
        // fade-in elements when user uses keyboard
        let duration = 1.5  // animation will take 1.0 seconds
        UIView.animateWithDuration(duration, animations: {
            // any changes entered in this block will be animated
            // animation block from http://mathewsanders.com/prototyping-iOS-iPhone-iPad-animations-in-swift/
            // fade-in elements
            self.tipControl.alpha = 1
            self.tipLabel.alpha = 1
            self.tipPercentLabel.alpha = 1
            self.totalLabel.alpha = 1
            self.twoWayLabel.alpha = 1
            self.threeWayLabel.alpha = 1
            self.fourWayLabel.alpha = 1
            self.totalStaticLabel.alpha = 1
            self.twoWayStaticLabel.alpha = 1
            self.threeWayStaticLabel.alpha = 1
            self.fourWayStaticLabel.alpha = 1
            self.horzRule.alpha = 1
            self.splitBillLabel.alpha = 1
        })
    }

    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }
}

