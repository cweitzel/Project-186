//
//  ViewController.swift
//  Team group 6 186
//
//  Created by Taylor Weil and  no one else on 2/6/18.
//  Copyright © 2018 Taylor Weil. All rights reserved.
//  Yeet!

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var textFieldName: UITextField!
    @IBOutlet weak var textView: UITextView!
   

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
   
    
    @IBAction func enterTapped(_ sender: Any) {
        let test = Test(input: textFieldName.text!) //creates an object to test user input
        textView.text = test.getOut() //prints the output
    }
}


