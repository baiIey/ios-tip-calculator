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
    @IBOutlet weak var billLabel: UILabel!
    
    
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
    
    var accentColor : UIColor! = UIColor.clearColor()
    var cornerRadius : CGFloat! = 0
    var keySize : CGSize! = CGSize(width: 65, height: 65)
    
    var isEditing: Bool! = false
    var expression: String! = "um..." // text when calc value is nil
    
    var tipStepperValue: Double! = 18 // stored stepper values
    var splitStepperValue: Double! = 1
    var totalBill : String! = "0"
    
    var animationTiming : Double = 0.8 // animation timing
    
    var frameWidth : UInt32 = 320 // device viewport width
    var frameHeight : UInt32 = 568 // device viewport height
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        tipStepper.value = 18 // displayed stepper values
        splitStepper.value = 1
        
        keySize = CGSize(width: Int(frameWidth/3), height: 65)
        
        frameWidth = UInt32(self.view.frame.width)
        frameHeight = UInt32(self.view.frame.height)
        var borderWidth : CGFloat = 1 // button border width
        var keyBackgroundColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 0.15) // button background color
        var keyTextColor = UIColor(red: 246/255, green: 246/255, blue: 246/255, alpha: 0.75) // button label color
        
        // Setup keypad borders
        keyDel.backgroundColor = keyBackgroundColor
        keyDel.layer.cornerRadius = cornerRadius
        keyDel.layer.borderWidth = borderWidth
        keyDel.layer.borderColor = accentColor.CGColor
        keyDel.frame.size = keySize
        keyDel.setTitleColor(keyTextColor, forState: UIControlState.Normal)
        keyDel.frame.origin.x = CGFloat((frameWidth/3)*2 + (UInt32(borderWidth)*2))
        keyDel.frame.origin.y = CGFloat(frameHeight - UInt32(keySize.height))
        
        key0.backgroundColor = keyBackgroundColor
        key0.layer.cornerRadius = cornerRadius
        key0.layer.borderWidth = borderWidth
        key0.layer.borderColor = accentColor.CGColor
        key0.frame.size.width = CGFloat(((frameWidth/3)*2) + UInt32(borderWidth))
        key0.frame.size.height = keySize.height
        key0.setTitleColor(keyTextColor, forState: UIControlState.Normal)
        key0.titleEdgeInsets = UIEdgeInsets(top: 0, left: -(CGFloat(frameWidth/3)), bottom: 0, right: 0)
        key0.frame.origin.x = 0
        key0.frame.origin.y = CGFloat(frameHeight - UInt32(keySize.height))
        
        key1.backgroundColor = keyBackgroundColor
        key1.layer.cornerRadius = cornerRadius
        key1.layer.borderWidth = borderWidth
        key1.layer.borderColor = accentColor.CGColor
        key1.setTitleColor(keyTextColor, forState: UIControlState.Normal)
        key1.frame.size = keySize
        key1.frame.origin.x = 0
        key1.frame.origin.y = CGFloat(frameHeight - (UInt32(keySize.height)*4) - (UInt32(borderWidth)*3))
        
        key2.backgroundColor = keyBackgroundColor
        key2.layer.cornerRadius = cornerRadius
        key2.layer.borderWidth = borderWidth
        key2.layer.borderColor = accentColor.CGColor
        key2.frame.size = keySize
        key2.setTitleColor(keyTextColor, forState: UIControlState.Normal)
        key2.frame.origin.x = CGFloat(frameWidth/3 + UInt32(borderWidth))
        key2.frame.origin.y = CGFloat(frameHeight - (UInt32(keySize.height)*4) - (UInt32(borderWidth)*3))

        key3.backgroundColor = keyBackgroundColor
        key3.layer.cornerRadius = cornerRadius
        key3.layer.borderWidth = borderWidth
        key3.layer.borderColor = accentColor.CGColor
        key3.frame.size = keySize
        key3.setTitleColor(keyTextColor, forState: UIControlState.Normal)
        key3.frame.origin.x = CGFloat((frameWidth/3)*2 + (UInt32(borderWidth)*2))
        key3.frame.origin.y = CGFloat(frameHeight - (UInt32(keySize.height)*4) - (UInt32(borderWidth)*3))
        
        key4.backgroundColor = keyBackgroundColor
        key4.layer.cornerRadius = cornerRadius
        key4.layer.borderWidth = borderWidth
        key4.layer.borderColor = accentColor.CGColor
        key4.frame.size = keySize
        key4.setTitleColor(keyTextColor, forState: UIControlState.Normal)
        key4.frame.origin.x = 0
        key4.frame.origin.y = CGFloat(frameHeight - (UInt32(keySize.height)*3) - (UInt32(borderWidth)*2))
        
        key5.backgroundColor = keyBackgroundColor
        key5.layer.cornerRadius = cornerRadius
        key5.layer.borderWidth = borderWidth
        key5.layer.borderColor = accentColor.CGColor
        key5.frame.size = keySize
        key5.setTitleColor(keyTextColor, forState: UIControlState.Normal)
        key5.frame.origin.x = CGFloat(frameWidth/3 + UInt32(borderWidth))
        key5.frame.origin.y = CGFloat(frameHeight - (UInt32(keySize.height)*3) - (UInt32(borderWidth)*2))
        
        key6.backgroundColor = keyBackgroundColor
        key6.layer.cornerRadius = cornerRadius
        key6.layer.borderWidth = borderWidth
        key6.layer.borderColor = accentColor.CGColor
        key6.frame.size = keySize
        key6.setTitleColor(keyTextColor, forState: UIControlState.Normal)
        key6.frame.origin.x = CGFloat((frameWidth/3)*2 + (UInt32(borderWidth)*2))
        key6.frame.origin.y = CGFloat(frameHeight - (UInt32(keySize.height)*3) - (UInt32(borderWidth)*2))
        
        key7.backgroundColor = keyBackgroundColor
        key7.layer.cornerRadius = cornerRadius
        key7.layer.borderWidth = borderWidth
        key7.layer.borderColor = accentColor.CGColor
        key7.frame.size = keySize
        key7.setTitleColor(keyTextColor, forState: UIControlState.Normal)
        key7.frame.origin.x = 0
        key7.frame.origin.y = CGFloat(frameHeight - (UInt32(keySize.height)*2) - UInt32(borderWidth))
        
        key8.backgroundColor = keyBackgroundColor
        key8.layer.cornerRadius = cornerRadius
        key8.layer.borderWidth = borderWidth
        key8.layer.borderColor = accentColor.CGColor
        key8.frame.size = keySize
        key8.setTitleColor(keyTextColor, forState: UIControlState.Normal)
        key8.frame.origin.x = CGFloat(frameWidth/3 + UInt32(borderWidth))
        key8.frame.origin.y = CGFloat(frameHeight - (UInt32(keySize.height)*2) - UInt32(borderWidth))
        
        key9.backgroundColor = keyBackgroundColor
        key9.layer.cornerRadius = cornerRadius
        key9.layer.borderWidth = borderWidth
        key9.layer.borderColor = accentColor.CGColor
        key9.frame.size = keySize
        key9.setTitleColor(keyTextColor, forState: UIControlState.Normal)
        key9.frame.origin.x = CGFloat((frameWidth/3)*2 + (UInt32(borderWidth)*2))
        key9.frame.origin.y = CGFloat(frameHeight - (UInt32(keySize.height)*2) - UInt32(borderWidth))
        // end keypad setup
        
        // style 
        detailViewButton.layer.cornerRadius = 12.5
        detailViewButton.backgroundColor = UIColor.whiteColor()
        
        // make $0 large on initial load
        self.totalLabel.transform = CGAffineTransformMakeScale(1.5, 1.5)
        self.totalLabel.frame.origin.y = 75
        
        // hide controls on initial load
        self.tipStepper.hidden = true
        self.splitStepper.hidden = true
        self.finalLabel.hidden = true
        self.splitLabel.hidden = true
        self.tipLabel.hidden = true
        self.detailViewButton.hidden = true
        self.tipStepper.alpha = 0
        self.splitStepper.alpha = 0
        self.finalLabel.alpha = 0
        self.splitLabel.alpha = 0
        self.tipLabel.alpha = 0
        self.detailViewButton.alpha = 0

        updateLabels()
        detailViewAnimation()
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
//        finalLabel.text = "you pay \(payoutFormat)"
    
        if (splitStepperValue == 1) { // use text for split values less than ten
            splitLabel.text = "don't split bill"
            finalLabel.text = "you pay \(payoutFormat)"
        } else if (splitStepperValue == 2) {
            splitLabel.text = "split two ways"
            finalLabel.text = "each pays \(payoutFormat)"
        } else if (splitStepperValue == 3) {
            splitLabel.text = "split three ways"
            finalLabel.text = "each pays \(payoutFormat)"
        } else if (splitStepperValue == 4) {
            splitLabel.text = "split four ways"
            finalLabel.text = "each pays \(payoutFormat)"
        } else if (splitStepperValue == 5) {
            splitLabel.text = "split five ways"
            finalLabel.text = "each pays \(payoutFormat)"
        } else if (splitStepperValue == 6) {
            splitLabel.text = "split six ways"
            finalLabel.text = "each pays \(payoutFormat)"
        } else if (splitStepperValue == 7) {
            splitLabel.text = "split seven ways"
            finalLabel.text = "each pays \(payoutFormat)"
        } else if (splitStepperValue == 8) {
            splitLabel.text = "split eight ways"
            finalLabel.text = "each pays \(payoutFormat)"
        } else if (splitStepperValue == 9) {
            splitLabel.text = "split nine ways"
            finalLabel.text = "each pays \(payoutFormat)"
        } else {
            splitLabel.text = String(format: "split %g ways", splitStepperValue)
            finalLabel.text = "each pays \(payoutFormat)"
        }
    }
    
    func fadeOutControls(){
        UIView.animateWithDuration(animationTiming, animations: { () -> Void in
            self.tipStepper.alpha = 0
            self.splitStepper.alpha = 0
            self.finalLabel.alpha = 0
            self.splitLabel.alpha = 0
            self.tipLabel.alpha = 0
            self.detailViewButton.alpha = 0
            self.billLabel.hidden = false
            self.billLabel.alpha = 0.8
            }, completion: { (True) -> Void in
                self.tipStepper.hidden = true
                self.splitStepper.hidden = true
                self.finalLabel.hidden = true
                self.splitLabel.hidden = true
                self.tipLabel.hidden = true
                self.detailViewButton.hidden = true
        })
    }
    
    func fadeInControls(){
        UIView.animateWithDuration(animationTiming, animations: { () -> Void in
            self.tipStepper.alpha = 0.8
            self.splitStepper.alpha = 0.8
            self.finalLabel.alpha = 0.8
            self.splitLabel.alpha = 0.8
            self.tipLabel.alpha = 0.8
            self.detailViewButton.alpha = 0.8
            self.billLabel.alpha = 0
            self.tipStepper.hidden = false
            self.splitStepper.hidden = false
            self.finalLabel.hidden = false
            self.splitLabel.hidden = false
            self.tipLabel.hidden = false
            self.detailViewButton.hidden = false
            self.billLabel.hidden = true
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
        
        if (tipStepperValue >= 15){
            UIView.animateWithDuration(animationTiming, animations: { () -> Void in
                self.calcView.backgroundColor = UIColor(red: 15/255, green: 157/255, blue: 88/255, alpha: 1) // green
            })
        } else if (tipStepperValue <= 14){
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
        let blurEffect: UIBlurEffect = UIBlurEffect(style: .Dark)
        
        let blurView: UIVisualEffectView = UIVisualEffectView(effect: blurEffect)
        blurView.setTranslatesAutoresizingMaskIntoConstraints(false)
        self.view.addSubview(blurView)
    }
    
    func detailViewAnimation(){
        UIView.animateWithDuration(animationTiming, delay: 0.0, options: .Repeat | .Autoreverse | .AllowUserInteraction, animations: { () -> Void in
            self.detailViewButton.transform = CGAffineTransformMakeScale(1.2, 1.2)
        }) { (Bool) -> Void in
            // intentially empty
        }

    }

}
