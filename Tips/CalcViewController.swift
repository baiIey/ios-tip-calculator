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
    @IBOutlet var calcView: UIView!
    @IBOutlet weak var detailViewButton: UIView!
    
    // keypad outlets
    @IBOutlet weak var key0: UIButton!
    @IBOutlet weak var key1: UIButton!
    @IBOutlet weak var key2: UIButton!
    @IBOutlet weak var key3: UIButton!
    @IBOutlet weak var key4: UIButton!
    @IBOutlet weak var key5: UIButton!
    @IBOutlet weak var key6: UIButton!
    @IBOutlet weak var key7: UIButton!
    @IBOutlet weak var key8: UIButton!
    @IBOutlet weak var key9: UIButton!
    @IBOutlet weak var keyDel: UIButton!
    
    // stepper outlets
    @IBOutlet weak var tipStepper: UIStepper!
    @IBOutlet weak var splitStepper: UIStepper!
    
    var accentColor : UIColor! = UIColor(red: 255/255, green: 255/225, blue: 255/225, alpha: 0.5)
    var cornerRadius : CGFloat! = 32
    var keySize : CGSize! = CGSize(width: 65, height: 65)
    
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
        
        // Setup keypad borders
        key0.backgroundColor = UIColor.clearColor()
        key0.layer.cornerRadius = cornerRadius
        key0.layer.borderWidth = 1.5
        key0.layer.borderColor = accentColor.CGColor
        key0.frame.size = keySize
        
        key1.backgroundColor = UIColor.clearColor()
        key1.layer.cornerRadius = cornerRadius
        key1.layer.borderWidth = 1.5
        key1.layer.borderColor = accentColor.CGColor
        key1.frame.size = keySize
        
        key2.backgroundColor = UIColor.clearColor()
        key2.layer.cornerRadius = cornerRadius
        key2.layer.borderWidth = 1.5
        key2.layer.borderColor = accentColor.CGColor
        key2.frame.size = keySize
        
        key3.backgroundColor = UIColor.clearColor()
        key3.layer.cornerRadius = cornerRadius
        key3.layer.borderWidth = 1.5
        key3.layer.borderColor = accentColor.CGColor
        key3.frame.size = keySize
        
        key4.backgroundColor = UIColor.clearColor()
        key4.layer.cornerRadius = cornerRadius
        key4.layer.borderWidth = 1.5
        key4.layer.borderColor = accentColor.CGColor
        key4.frame.size = keySize
        
        key5.backgroundColor = UIColor.clearColor()
        key5.layer.cornerRadius = cornerRadius
        key5.layer.borderWidth = 1.5
        key5.layer.borderColor = accentColor.CGColor
        key5.frame.size = keySize
        
        key6.backgroundColor = UIColor.clearColor()
        key6.layer.cornerRadius = cornerRadius
        key6.layer.borderWidth = 1.5
        key6.layer.borderColor = accentColor.CGColor
        key6.frame.size = keySize
        
        key7.backgroundColor = UIColor.clearColor()
        key7.layer.cornerRadius = cornerRadius
        key7.layer.borderWidth = 1.5
        key7.layer.borderColor = accentColor.CGColor
        key7.frame.size = keySize
        
        key8.backgroundColor = UIColor.clearColor()
        key8.layer.cornerRadius = cornerRadius
        key8.layer.borderWidth = 1.5
        key8.layer.borderColor = accentColor.CGColor
        key8.frame.size = keySize
        
        key9.backgroundColor = UIColor.clearColor()
        key9.layer.cornerRadius = cornerRadius
        key9.layer.borderWidth = 1.5
        key9.layer.borderColor = accentColor.CGColor
        key9.frame.size = keySize
        // end keypad setup
        
        // make $0 large on initial load
        self.totalLabel.transform = CGAffineTransformMakeScale(1.5, 1.5)
        self.totalLabel.frame.origin.y = 75
        
        // hide controls on initial load
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
    
    func scaleUpBill(){
        UIView.animateWithDuration(animationTiming, animations: { () -> Void in
            self.totalLabel.transform = CGAffineTransformMakeScale(1.5, 1.5)
            self.totalLabel.frame.origin.y = 75
        })
    }
    
    func scaleDownBill(){
        UIView.animateWithDuration(animationTiming, animations: { () -> Void in
            self.totalLabel.transform = CGAffineTransformMakeScale(1, 1)
            self.totalLabel.frame.origin.y = 25
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
            scaleDownBill()
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
            scaleUpBill()
            UIView.animateWithDuration(animationTiming, animations: { () -> Void in
                self.calcView.backgroundColor = UIColor.blackColor()
            })
        } else if (totalBill == expression) {
            // nothing
        } else {
            billAmount = dropLast(billAmount)
            totalBill = billAmount
        }
        updateLabels()
    }
    
    @IBAction func tipStepper(sender: UIStepper) {
        println("\(tipStepperValue)% tip")
        tipStepperValue = sender.value
        updateLabels()
        
        if (tipStepperValue >= 18){
            UIView.animateWithDuration(animationTiming, animations: { () -> Void in
                self.calcView.backgroundColor = UIColor(red: 15/255, green: 157/255, blue: 88/255, alpha: 1) // green
            })
        } else if (tipStepperValue <= 17){
            UIView.animateWithDuration(animationTiming, animations: { () -> Void in
                self.calcView.backgroundColor = UIColor(red: 198/255, green: 18/255, blue: 11/255, alpha: 1) // red
            })
        }
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
    
    @IBAction func detailViewButtonDidPress(sender: UITapGestureRecognizer) {
        println("tapped detail view button")
    }
    
    func detailViewAnimation(){
        UIView.animateWithDuration(animationTiming, animations: { () -> Void in
            self.animationTiming
        })
    }

}
