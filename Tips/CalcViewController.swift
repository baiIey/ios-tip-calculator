//
//  CalcViewController.swift
//  Gratuity
//
//  Created by Brian Bailey on 4/2/15.
//  Copyright (c) 2015 brbailey. All rights reserved.
//

import UIKit

class CalcViewController: UIViewController {

    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var finalLabel: UILabel!
    @IBOutlet weak var splitLabel: UILabel!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var numberButton: UIButton!
    @IBOutlet var calcView: UIView!
    
    @IBOutlet weak var tipStepper: UIStepper!
    @IBOutlet weak var splitStepper: UIStepper!
    
    var isEditing: Bool! = false
    var expression: String! = "um..." // text when calc value is nil
    
    var tipStepperValue: Double! = 18 // stored stepper values
    var splitStepperValue: Double! = 1
    var totalBill : String! = "0"
    
    var animationTiming : Double = 0.8 // animation timing
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        tipStepper.value = 18 // displayed stepper values
        splitStepper.value = 1
        
        // hide controls on load
        self.tipStepper.hidden = true
        self.splitStepper.hidden = true
        self.finalLabel.hidden = true
        self.splitLabel.hidden = true
        self.tipLabel.hidden = true
        self.tipStepper.alpha = 0
        self.splitStepper.alpha = 0
        self.finalLabel.alpha = 0
        self.splitLabel.alpha = 0
        self.tipLabel.alpha = 0

        updateLabels()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func updateLabels(){
        // math
        var enteredValue = (NSString(string: totalBill).doubleValue) / 100
        var tipPercentMath = (tipStepperValue / 100) * enteredValue
        var splitMath = (enteredValue + tipPercentMath) / splitStepperValue
        var payMath = (enteredValue + tipPercentMath) / splitStepperValue
        
        // formating
        var tipStepperFormat = String(format: "%g", tipStepperValue)
        var tipPercentFormat = String(format: "%.2f", tipPercentMath)
        var totalBillFormat = String(format: "%.2f", enteredValue)
        var payoutFormat = String(format: "$%.2f", payMath)
        
        // printing
        totalLabel.text = "$\(totalBillFormat)"
        tipLabel.text = "\(tipStepperFormat)% is $\(tipPercentFormat)"
        finalLabel.text = "you pay \(payoutFormat)"
    
        if (splitStepperValue == 1) { // use text for split values less than ten
            splitLabel.text = "don't split bill"
        } else if (splitStepperValue == 2) {
            splitLabel.text = "split two ways"
        } else if (splitStepperValue == 3) {
            splitLabel.text = "split three ways"
        } else if (splitStepperValue == 4) {
            splitLabel.text = "split four ways"
        } else if (splitStepperValue == 5) {
            splitLabel.text = "split five ways"
        } else if (splitStepperValue == 6) {
            splitLabel.text = "split six ways"
        } else if (splitStepperValue == 7) {
            splitLabel.text = "split seven ways"
        } else if (splitStepperValue == 8) {
            splitLabel.text = "split eight ways"
        } else if (splitStepperValue == 9) {
            splitLabel.text = "split nine ways"
        } else {
            splitLabel.text = String(format: "split %g ways", splitStepperValue)
        }
    }
    
    func fadeOutControls(){
        UIView.animateWithDuration(animationTiming, animations: { () -> Void in
            self.tipStepper.alpha = 0
            self.splitStepper.alpha = 0
            self.finalLabel.alpha = 0
            self.splitLabel.alpha = 0
            self.tipLabel.alpha = 0
            }, completion: { (True) -> Void in
                self.tipStepper.hidden = true
                self.splitStepper.hidden = true
                self.finalLabel.hidden = true
                self.splitLabel.hidden = true
                self.tipLabel.hidden = true
        })
    }
    
    func fadeInControls(){
        UIView.animateWithDuration(animationTiming, animations: { () -> Void in
            self.tipStepper.alpha = 1
            self.splitStepper.alpha = 1
            self.finalLabel.alpha = 1
            self.splitLabel.alpha = 1
            self.tipLabel.alpha = 1
            self.tipStepper.hidden = false
            self.splitStepper.hidden = false
            self.finalLabel.hidden = false
            self.splitLabel.hidden = false
            self.tipLabel.hidden = false
            }, completion: { (True) -> Void in
 
        })
    }
    
    @IBAction func numberPressed(sender: AnyObject) {
        println("pressed \(sender.currentTitle)")
        var number = sender.currentTitle
        var numberString : String! = number
        if (isEditing==false && numberString=="0"){
            println("first number cannot be zero")
        } else if (isEditing==false){ //
            totalBill = number
            isEditing = true
            fadeInControls()
        } else if (totalBill == expression) {
            totalBill = number
        } else { // add number to end of string
           totalBill = totalBill! + number!!
        }
        updateLabels()
    }
    
    @IBAction func deletePressed(sender: AnyObject) {
        println("pressed delete")
        var billAmount: String = totalBill
        let stringLength = count(billAmount)
        println("\(stringLength)")
        
        if (stringLength == 1) {
            totalBill = expression
            isEditing = false
            fadeOutControls()
        } else if (totalBill == expression) {
            // nothing
        } else {
            billAmount = dropLast(billAmount)
            totalBill = billAmount
        }
        updateLabels()
    }
    
    @IBAction func tipStepper(sender: UIStepper) {
        println("tapped tipStepper")
        tipStepperValue = sender.value
        
        updateLabels()
    }
    
    @IBAction func splitStepper(sender: UIStepper) {
        println("tapped splitStepper")
        splitStepperValue = sender.value
        updateLabels()
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
