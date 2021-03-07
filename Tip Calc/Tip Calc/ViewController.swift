//
//  ViewController.swift
//  Tip Calc
//
//  Created by Mohammed Uddin on 3/7/21.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var billAmtTextBox: UITextField!
    
    
    @IBOutlet weak var tenPercentTip: UILabel!
    
    @IBOutlet weak var fifteenPercentTip: UILabel!
    
    @IBOutlet weak var twentyPercentTip: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func calcTip(_ sender: Any) {
        
        if let subTotal = billAmtTextBox.text
        {
            let totalBill = Double(subTotal) ?? 0
            
            tenPercentTip.text = String(format: "($%.2f)", totalBill * 0.10)
            
            fifteenPercentTip.text = String(format: "($%.2f)", totalBill * 0.15)
            
            twentyPercentTip.text = String(format: "($%.2f)", totalBill * 0.20)
        }
    }
    

}

