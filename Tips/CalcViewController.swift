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
    
    @IBOutlet weak var tipStepper: UIStepper!
    @IBOutlet weak var splitStepper: UIStepper!
    
    var isEditing: Bool! = false
    var expression: String! = "um..." // text when calc value is nil
    
    var tipStepperValue: Double! = 18
    var splitStepperValue: Double! = 2
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        totalLabel.text = "0"
        tipStepper.value = 18
        splitStepper.value = 1

        updateLabels()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func updateLabels() {
        tipLabel.text = "\(tipStepperValue)% is $20.00"
        splitLabel.text = "split \(splitStepperValue) ways"
        finalLabel.text = totalLabel.text
    }
    
    @IBAction func numberPressed(sender: AnyObject) {
        println("pressed \(sender.currentTitle)")
        var number = sender.currentTitle
        if (isEditing==false ){ //
            totalLabel.text = number
            isEditing = true
        } else if (totalLabel.text == expression) {
            totalLabel.text = number
        } else { // add number to end of string
           totalLabel.text = totalLabel.text! + number!!
        }
        updateLabels()
    }
    
    @IBAction func deletePressed(sender: AnyObject) {
        println("pressed delete")
        var billAmount: String = totalLabel.text!
        let stringLength = countElements(billAmount)
        println("\(stringLength)")
        
        if (stringLength == 1) {
            totalLabel.text = expression
        } else if (totalLabel.text == expression) {
            // nothing
        } else {
            billAmount = dropLast(billAmount)
            totalLabel.text = billAmount
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
