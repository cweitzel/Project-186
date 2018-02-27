//
//  controller.swift
//  Team group 6 186
//
//  Created by Noah Thompson on 2/14/18.
//  Copyright © 2018 Taylor Weil. All rights reserved.
//

import UIKit

class controller: UIViewController {
    //created a string variable
    var name: String = ""
    
    //our label to display input
    @IBOutlet weak var labelName: UILabel!
    
    //this is the text field we created
    @IBOutlet weak var textFieldName: UITextField!
    
    @IBAction func buttonClick(sender: UIButton) {
        //getting input from Text Field
        name = textFieldName.text!
        
        //Displaying input text into label
        labelName.text = "Hello \(name)"
}
}

