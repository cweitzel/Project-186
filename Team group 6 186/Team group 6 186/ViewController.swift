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
	

    override func viewDidLoad() {
        super.viewDidLoad()
		button.layer.borderWidth = 1
		textFieldName.layer.borderWidth = 1
		textView.layer.borderWidth = 1.5
		button.layer.cornerRadius = 10
		button.clipsToBounds = true
		textView.layer.cornerRadius=10
		textView.clipsToBounds = true
		textFieldName.layer.cornerRadius = 10
		textFieldName.clipsToBounds = true
		textView.isUserInteractionEnabled = false
		
		let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
		backgroundImage.image = UIImage(named: "tinge_1.jpg")
		backgroundImage.contentMode = UIViewContentMode.scaleAspectFill
		self.view.insertSubview(backgroundImage, at: 0)
		
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


