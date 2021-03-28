//
//  ViewController.swift
//  TaxApp
//
//  Created by Mohammed Uddin on 3/27/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var priceField: UITextField!
    
    @IBOutlet weak var taxField: UITextField!
    
    @IBOutlet weak var totalLabel: UILabel!
    
    @IBOutlet weak var luckySix: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        totalLabel.text = ""
        // Do any additional setup after loading the view.
    }


    @IBAction func calcTotal(_ sender: Any) {
        let price = Double(priceField.text!)!
        let tax = Double(taxField.text!)!
        
        let totalTax = price * tax
        let finalTotal = price + totalTax
        
        totalLabel.text = "$\(finalTotal)"
    }
    
    @IBAction func feelingLucky(_ sender: Any) {

       let random = Int.random(in: 0..<100)
        luckySix.text = "\(random)"
        
    }
    
    
}

