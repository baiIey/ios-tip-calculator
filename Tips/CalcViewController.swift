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
    
    var isEditing: Bool! = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        totalLabel.text = "0"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func numberPressed(sender: AnyObject) {
        println("pressed \(sender.currentTitle)")
        var number = sender.currentTitle
        
        if (isEditing==false ){ //
            totalLabel.text = number
            isEditing = true
        } else if (totalLabel.text == "EMPTY") {
            totalLabel.text = number
        } else { // add number to end of string
           totalLabel.text = totalLabel.text! + number!!
        }
        
        
    }
    
    @IBAction func deletePressed(sender: AnyObject) {
        println("pressed delete")
        var billAmount: String = totalLabel.text!
        let stringLength = countElements(billAmount)
        println("\(stringLength)")
        
        if (stringLength == 1) {
            totalLabel.text = "EMPTY"
        } else {
            billAmount = dropLast(billAmount)
            totalLabel.text = billAmount
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
