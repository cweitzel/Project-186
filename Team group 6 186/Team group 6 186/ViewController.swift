//
//  ViewController.swift
//  Team group 6 186
//
//  Created by Taylor Weil and  no one else on 2/6/18.
//  Copyright © 2018 Taylor Weil. All rights reserved.
//  Yeet!

import UIKit

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    var name: String = ""
    @IBOutlet weak var labelName: UILabel!
    @IBAction func buttonClick(sender: UIButton) {
        name = textFieldName.text!
        labelName.text = "Hello \(name)"
    }
    @IBOutlet weak var textFieldName:UITextField!
    
}

