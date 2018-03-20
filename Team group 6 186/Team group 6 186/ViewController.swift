//
//  ViewController.swift
//  Team group 6 186
//
//  Created by Taylor Weil and  no one else on 2/6/18.
//  Copyright © 2018 Taylor Weil. All rights reserved.kjn
//  Yeet!

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var button: UIButton!
    var background = "tinge_1.jpg"
    var outputText = Array(repeating: "", count: 13)
    var outputLine = 0;

    override func viewDidLoad() {
	
        super.viewDidLoad()
        button.layer.borderWidth = 1
        textField.layer.borderWidth = 1
        textView.layer.borderWidth = 1.5
        button.layer.cornerRadius = 15
        button.clipsToBounds = true
        textView.layer.cornerRadius=10
        textView.clipsToBounds = true
        textField.layer.cornerRadius = 10
        textField.clipsToBounds = true
        textView.isUserInteractionEnabled = false
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: background)
        backgroundImage.contentMode = UIViewContentMode.scaleAspectFill
        self.view.insertSubview(backgroundImage, at: 0)
        // Do any additional setup after loading the view, typically from a nib.
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func enterTapped(_ sender: Any) {
        printLine()
    }
    @IBAction func textFieldPrimaryActionTriggered(_ sender: Any) {
        printLine()
    }
    func printLine(){
        let test = Test(input: textField.text!)
        var print = ""
        outputText[outputLine] = test.getIn()
        outputLine = outputLine + 1
        outputText[outputLine] = test.getOut()
        outputLine = outputLine + 1
        while (outputLine >= 11){
            for i in 0...11{
                outputText[i] = outputText[i+1]
            }
            outputLine = outputLine - 1
        }
        for i in 0...outputLine+1{
            print += outputText[i] + "\n"
        }
        textView.text = print
        textField.text = ""
    }
}
