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
    var temp = "DefaultIn"
    //Initilizer takes input from ViewController and tests
    init(input: String){
        self.input = input.lowercased()
        //Put all new methurds below to be tested
		
        testHello()
        testNaughty()
        testJawn()
		testWhy()
		askQwershtin()
		testNo()
		testYes()
		testYou()
		
    }
    //Returns text output
    func getOut() -> String {
		return output;
	}
    
    //Methurds
    func testHello() {
        if (input.range(of: "hello") != nil){
            output = "Hello!";
        }
    }
    func testNaughty() {
        var badWords = [String]()
        badWords+=["shit", "bitch", "heck", "dick", "ass", "bastard", "hell ", "poop"]
        let size = badWords.count
        if (input.range(of: "fuck") != nil) {
            output = "Fuck you";
        }else{
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
	func testWhy() {
		if (input.range(of: "why") != nil){
			output = "why not?"
		}
	}
	func testNo(){
		if(input == "no"){
			output = "Too bad :("
		}
	}
	func testYes(){
		if(input == "yes"){
			output = "ThAt SouNdS YuMmy"
		}
	}
	func askQwershtin(){
		//Pulls file and puts everthing into an array
		if(output == "DefaultOut"){
			var qwersh = [String]()
			do{
				if let path = Bundle.main.path(forResource: "Qwershtins", ofType: "txt"){
					let data = try String(contentsOfFile:path, encoding: String.Encoding.utf8)
					qwersh = data.components(separatedBy: "\n")
				}
			}catch let err as NSError {
				print(err)
			}
			//Sums up probability
			var sum = 0
			var pick = 0
			for i in 0...(qwersh.count/2-1) {
				sum = sum + Int(qwersh[(i*2)])!
			}
			//Picks a random line
			var num = (Int(arc4random_uniform(UInt32(sum))))
			while(num >= 0){
				num = num - Int(qwersh[pick])!
				pick += 2
			}
			output = qwersh[pick-1]
		}
	}
	func testYou(){
		if (input.range(of: "you?") != nil){
			output = "Don't worry about it"
		}
		
	}
}
