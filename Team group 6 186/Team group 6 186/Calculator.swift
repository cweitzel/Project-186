//
//  Calculator.swift
//  Team group 6 186
//
//  Created by Taylor Weil on 3/6/18.
//  Copyright © 2018 Taylor Weil. All rights reserved.
//

import Foundation

class Calc {
	var first = "", second = "", type = ""
	var firstNum = -1.0, secondNum = -1.0, ans = -1.0
	
	init(first: String, second: String, type: String){
		self.first = first
		self.second = second
		self.type = type
		findNum()
		if ((type == "plus") || (type == "+")){getSum()}
		if ((type == "minus") || (type == "-")){getDiff()}
		if ((type == "times") || (type == "*")){getProduct()}
		if ((type == "divided") || (type == "/")){getQuotient()}
	}
	init(first: String){
		self.first = first
		findNum()
	}
	
	func getFirst() -> Double {
		return firstNum
	}
	func getAns() -> Double {
		return ans
	}
	
	func getSum() {
		ans = firstNum + secondNum
	}
	func getDiff() {
		ans = firstNum - secondNum
	}
	func getProduct() {
		ans = firstNum * secondNum
	}
	func getQuotient() {
		ans = firstNum / secondNum
	}
	
	func findNum(){
		second = second.replacingOccurrences(of: "?", with: "")
		if (Double(first) != nil){
			firstNum = Double(first)!
		}
		else { firstNum = makeNum(check: first)}
		if (Double(second) != nil){
			secondNum = Double(second)!
		}
		else { secondNum = makeNum(check: second)}
		
	}
	
	func makeNum(check: String) -> Double{
		var numbers = [String]()
		do{
			if let path = Bundle.main.path(forResource: "Numbers", ofType: "txt"){
				let data = try String(contentsOfFile:path, encoding: String.Encoding.utf8)
				numbers = data.components(separatedBy: "\n")
			}
		}catch let err as NSError {
			print(err)
		}
		for i in 0...numbers.count-1{
			if (numbers[i].lowercased().range(of: check) != nil) {
				return Double(i)
			}
		}
		return -1
	}
}
