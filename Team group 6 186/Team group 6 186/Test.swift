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
		if (input.range(of: "fuck") != nil) {
			output = "Fuck you";
		}
        else if (input.range(of: "shit") != nil ) ||
            (input.range(of: "bitch") != nil ) ||
            (input.range(of: "dick") != nil ) ||
            (input.range(of: "heck") != nil) ||
            (input.range(of: "ass") != nil) {
            output = "Watch your fucking mouth"
        }
        
	}
    func testJawn() {
        if (input.range(of: "jawn") != nil){
            output += ", jawn"
        }
    }
    
}
