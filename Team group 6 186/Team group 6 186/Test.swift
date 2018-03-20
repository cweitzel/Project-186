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
		first()
		second()
	}
	//Returns text output
	func getOut() -> String {
		return output;
	}
	
	//Returns text input
	func getIn() -> String {
		return input;
	}
	
	//General Responces (Priotity 1)
	func first(){
		askQwershtin()
		testNo()
		testYes()
		testHello()
		testWhy()
		testHello()
		testYou()
		testNuthin()
		testCoinToss()
		testQuestion()
		testThank()
		testSorry()
		testRude()
		testCalc()
		testDice()
		testTime()
		testDate()
	}
	
	//Additional Responcesv (Prioity 2)
	func second(){
		testNaughty()
		testJawn()
	}
	
	//Methurds
	func testHello() {
		if ((input.range(of: "hello") != nil) || (input.range(of: "😊") != nil)){
			output = "Hello!";
		}
	}
	func testNaughty() {
		var badWords = [String]()
		badWords+=["shit", "bitch", "heck", "dick", "ass", "bastard", "hell ", "poop", "damn", "🖕🏻", "hell?"]
		let size = badWords.count
		if (input.range(of: "fuck") != nil) {
			output = "Fuck you";
		}else{
			for i in (0...size-1){
				if (input.range(of: badWords[i]) != nil){
					output = "Watch your fucking mouth"
					for j in 0...badWords.count-1{
						input = input.replacingOccurrences(of: badWords[j], with: "🤬", options: .literal, range: nil)
					}
				}
			}
		}
	}
	func testJawn() {
		if (input.range(of: "jawn") != nil){
			output = output.replacingOccurrences(of: "?", with: ",")
			output += " jawn"
		}
	}
	func testCoinToss(){
		if (input == "flip a coin"){
			let coin = (arc4random_uniform(2))
			if(coin == 1){
				output = "Heads"
			}
			else{output = "Tails"}
		}
	}
	func testCalc(){
		var marker = ""
		if (input.range(of: "what is") != nil) {
			var mathArr = input.components(separatedBy: " ")
			if (mathArr.count == 5){
				let calc = Calc(first: mathArr[2], second: mathArr[4], type: mathArr[3])
				output = String(calc.getAns())
			}
			else if (mathArr.count == 3){
				for chr in mathArr[2] {
					if (!(chr >= "0" && chr <= "9")) {
						marker = String(chr)
					}
				}
				var newMathArr = mathArr[2].components(separatedBy: marker)
				let calc = Calc(first: newMathArr[0], second: newMathArr[1], type: marker)
				output = String(calc.getAns())
			}
			else {output = "Sorry, I either can't dp that, or just don't want to"}
		}
	}
	func testWhy() {
		if (input.range(of: "why") != nil){
			output = "why not?"
		}
	}
	func testNo(){
		if(input == "no"){output = "Too bad :("}
	}
	func testYes(){
		if(input == "yes"){output = "Excellent!"}
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
		if (input.range(of: "you") != nil) {output = "Don't worry about it"}
	}
	func testNuthin(){
		if (input == ""){output = "I can't hear you."}
	}
	func testQuestion(){
		if (input.range(of: "what") != nil) && (input.range(of: "?") != nil){
			let response = (arc4random_uniform(2))
			if (response == 1){output = "Don't worry about it."}
			else {output = "I dunno, you tell me."}
			func testCalc(){
				if (input.range(of: "what is") != nil) {
					var mathArr = input.components(separatedBy: " ")
					let calc = Calc(first: mathArr[2], second: mathArr[4], type: mathArr[3])
					output = String(calc.getAns())
				}
			}
		}
	}
	func testThank(){
		if (input.range(of: "thank") != nil){output = "You're very welcome :)"}
	}
	func testRude(){
		if (input.range(of: "stupid") != nil) || (input.range(of: "dumb") != nil){
			output = "How rude!"
		}
	}
	func testSorry(){
		if (input.range(of: "sorry") != nil){output = "No hard feelings 😃"}
	}
	func testDice(){
		if(input.range(of: "roll") != nil && input.range(of: "die") != nil)
		{output = String(arc4random_uniform(6)+1)}
	}
	func testCelciustoFarenheit(){
		if (input.range(of: "to Farenheit") != nil)
		{/*Yet to be finished*/}
	}
	func testTime(){
		if (input.range(of: "what") != nil && input.range(of: "time") != nil){
			let currentDate = Date()
			let userCalendar = Calendar.current
			var hour = userCalendar.component(.hour, from: currentDate)
			let minutes = userCalendar.component(.minute, from: currentDate)
			//let seconds = userCalendar.component(.second, from: currentDate)
			if(hour>12){hour = hour-12}
			output = "The time is \(hour) hours and \(minutes) minutes"
		}
	}
	func testDate(){
		if(input.range(of: "what") != nil && input.range(of: "date") != nil)
		{
			let currentDate = Date()
			let formatter = DateFormatter()
			
			formatter.dateFormat = "MM-dd-yyyy"
			output = "The date is \(formatter.string(from: currentDate))"
		}
	}
}
