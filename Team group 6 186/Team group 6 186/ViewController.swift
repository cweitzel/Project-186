//
//  ViewController.swift
//  Team group 6 186
//
//  Created by Taylor Weil and  no one else on 2/6/18.
//  Copyright © 2018 Taylor Weil. All rights reserved.kjn
//  Yeet!

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var textFieldName: UITextField!
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var button: UIButton!
    var background = "tinge_1.jpg"
	var arr = [String]()
	var size: Int = 0
	
    override func viewDidLoad() {
        
        super.viewDidLoad()
        button.layer.borderWidth = 1
        textFieldName.layer.borderWidth = 1
        textView.layer.borderWidth = 1.5
        button.layer.cornerRadius = 15
        button.clipsToBounds = true
        textView.layer.cornerRadius=10
        textView.clipsToBounds = true
        textFieldName.layer.cornerRadius = 10
        textFieldName.clipsToBounds = true
        textView.isUserInteractionEnabled = false
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: background)
        backgroundImage.contentMode = UIViewContentMode.scaleAspectFill
        self.view.insertSubview(backgroundImage, at: 0)
		if (Int(UIScreen.main.bounds.height) == 736){
			size = 10
		}
		else if (Int(UIScreen.main.bounds.height) == 1024){
			size = 24
		}
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
		arr.append(textFieldName.text!.lowercased()) //Adds input to array
		let test = Test(input: arr) //creates test and generates output
		arr = test.getOut() //adds output from test to the array
		var print = ""
		
		
		let i = arr.count - size
		
		for i in i..<size+i {
			if(i>=0 && i<arr.count){
			print += "\(arr[i]) \n"
			}
		}
		       	textView.text = print

		        textFieldName.text = ""
    }
	
}
