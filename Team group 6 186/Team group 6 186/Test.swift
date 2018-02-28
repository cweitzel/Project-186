//
//  Test.swift
//  Team group 6 186
//
//  Created by Taylor Weil on 2/27/18.
//  Copyright © 2018 Taylor Weil. All rights reserved.
//

import Foundation
import UIKit

class Test  {
    
    var input = "DefaultIn"
    var output = "DefaultOut"
    
    //Initilizer takes input from ViewController and tests
    init(input: String){
        self.input = input.lowercased()
        
        //Put all new methurds below to be tested
        testHello()
		testNaughty()
        testJawn()
        
    }
 
    //Returns text outputy
    func getOut() -> String {
        return output;
    }
    
    
    func testHello() {
        if (input == "hello"){
            output = "Hello! How are you?";
        }
    }
	
	func testNaughty() {
		var badWords = [String]()
		badWords+=["shit", "bitch", "heck", "dick", "ass", "bastard", "hell ", "poop"]
		let size = badWords.count
		
		if (input.range(of: "fuck") != nil) {
			output = "Fuck you";
		}
		else{
			for i in (0...size-1){
				if (input.range(of: badWords[i]) != nil){
					output = "Watch your fucking mouth"
					}
				}
        	}
	}
	
    func testJawn() {
        if (input.range(of: "jawn") != nil){
            output += ", jawn"
        }
    }
    
}
