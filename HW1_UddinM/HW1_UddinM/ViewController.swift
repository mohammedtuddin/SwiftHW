//
//  ViewController.swift
//  HW1_UddinM
//
//  Created by Mohammed Uddin on 2/15/21.
//

import UIKit

class ViewController: UIViewController {
    var lightOn = true
    
    @IBAction func buttonPressed(_ sender: AnyObject) {
        lightOn = !lightOn
        updateUI()
    }
    
    func updateUI(){
        view.backgroundColor = lightOn ? .white : .black
    }
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

