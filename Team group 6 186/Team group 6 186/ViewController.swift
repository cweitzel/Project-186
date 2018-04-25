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
	
	@IBOutlet weak var weatherView: UITextView!
    var background = "tinge_1.jpg"
    var arr = [String]()
    var activeUser: User = User()
    var size: Int = 6
    
    @IBOutlet weak var weatherDisplay: UITextView!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        button.layer.borderWidth = 1
        textFieldName.layer.borderWidth = 1
        textView.layer.borderWidth = 1.5
        weatherDisplay.layer.borderWidth = 1.5
        button.layer.cornerRadius = 15
        button.clipsToBounds = true
        textView.layer.cornerRadius=10
        textView.clipsToBounds = true
        textFieldName.layer.cornerRadius = 10
        textFieldName.clipsToBounds = true
        weatherDisplay.layer.cornerRadius=10
        weatherDisplay.isHidden = true
        textView.isUserInteractionEnabled = false
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: background)
        backgroundImage.contentMode = UIViewContentMode.scaleAspectFill
        self.view.insertSubview(backgroundImage, at: 0)
        
        if (Int(UIScreen.main.bounds.height) == 736){
            size = 12
        }
        else if (Int(UIScreen.main.bounds.height) == 1024){
            size = 27
        }
        
        //Weather information here
        let weather = WeatherGetter()
        weather.getWeather(city: "Ames")
        let array = weather.getArray()
        sleep(2)
        let temperature = String(format: "%@", array[4] as! CVarArg)
        let tempAsDouble = Double(temperature)
        let convertedTemp = ((tempAsDouble! - 273)*1.8)+32
        weatherDisplay.text = array[1] as! String + "\n"
        weatherDisplay.text.append(String(convertedTemp))
        weatherDisplay.text.append(" Fahrenheit\n")
        weatherDisplay.text.append("Humidity: " + String(format: "%@", array[5] as! CVarArg) + "%\n")
        weatherDisplay.text.append("Cloud Cover: " + String(format: "%@", array[7] as! CVarArg) + "%")
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func enterTapped(_ sender: Any) {
		if (weatherDisplay.isHidden == false){
			weatherDisplay.isHidden = true
		}
        printLine()
		
    }
    @IBAction func textFieldPrimaryActionTriggered(_ sender: Any) {
		if (weatherDisplay.isHidden == false){
			weatherDisplay.isHidden = true
		}
        printLine()
		
    }
    
    func printLine(){
        arr.append(textFieldName.text!.lowercased()) //Adds input to array
        let test = Test(input: arr,user: activeUser) //creates test and generates output
        
        if (test.testWeather()) {
            if (weatherDisplay.isHidden) {weatherDisplay.isHidden = false}
        }
        if(test.getOut()[test.getOut().count-1] != ("")){
            arr = test.getOut() //adds output from test to the array
        }
        var print = ""
        let i = arr.count - size
        
        for i in i..<size+i {
            if(i>=0 && i<arr.count){
                print += "\(arr[i]) \n"
            }
        }
        textView.text = print
        textFieldName.text = ""
        activeUser = test.getUser()
    }
    
}
