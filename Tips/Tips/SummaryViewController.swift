//
//  SummaryViewController.swift
//  Gratuity
//
//  Created by Brian Bailey on 4/3/15.
//  Copyright (c) 2015 brbailey. All rights reserved.
//

import UIKit

class SummaryViewController: UIViewController {

    @IBOutlet weak var calcViewButton: UIView!
    @IBOutlet weak var billSummary: UILabel!
    
    var animationTiming : Double = 0.8 // animation timing
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        
    }
    
    override func viewWillAppear(animated: Bool) {
        // style
        calcViewButton.layer.cornerRadius = 12.5
        
        calcViewAnimation()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func calcViewAnimation(){
        UIView.animateWithDuration(animationTiming, delay: 0.0, options: .Repeat | .Autoreverse | .AllowUserInteraction, animations: { () -> Void in
            self.calcViewButton.transform = CGAffineTransformMakeScale(1.2, 1.2)
            }) { (Bool) -> Void in
                // intentially empty
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

    @IBAction func calcViewDidTap(sender: UITapGestureRecognizer) {
        println("Dimiss summary view")
        UIView.animateWithDuration(0.4, delay: 0.0, options: nil, animations: { () -> Void in
            self.calcViewButton.transform = CGAffineTransformMakeScale(50, 50)
        }) { (Bool) -> Void in
            self.dismissViewControllerAnimated(true, completion: nil) // segue when complete
        }
    }
}
