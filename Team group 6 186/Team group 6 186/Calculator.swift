//
//  Calculator.swift
//  Team group 6 186
//
//  Created by Taylor Weil on 3/6/18.
//  Copyright © 2018 Taylor Weil. All rights reserved.
//

import Foundation

class Calc {
    var first = "", second = "", type = "", equation = "", fraction = ""
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
        //TEMPRATURE CONVERSIONS
        
        //fahrenheit and celsius
        if ((second == "fahrenheit") && (type == "celsius")) {getCelsius()}
        if ((second == "celsius") && (type == "fahrenheit")){getFahrenheit()}
        //fahrenheit and kelvin
        if ((second == "fahrenheit") && (type == "kelvin")) {getKelvin()}
        if ((second == "kelvin") && (type == "fahrenheit")) {getFahrenheitK()}
        //celsius and kelvin
        if ((second == "celsius") && (type == "kelvin")){ans = firstNum + 273.15}
        if ((second == "kelvin") && (type == "celsius")){ans = firstNum - 273.15}
        
        // LENGTH CONVERSIONS
        
        //kilometers and miles
        if ((second == "kilometers") || (second == "km") && (type == "miles")){getMiles()}
        if((second == "miles") && (type == "kilometers") || (type == "km")){getKm()}
        //meters and miles
        if ((second == "meters") && (type == "miles")){
            getMetersToMiles()
        }
        //kilometers and meters
        if ((second == "kilometers") || (second == "km") && (type == "meters"))
        {ans = firstNum*1000;}
        if ((second == "meters") && (type == "kilometers")  || (type == "km") )
        {ans = firstNum/1000;}
        
        
        //SPEED CONVERSIONS
        
        //CURRENCY CONVERSIONS
        if ((second == "dollars") || (second == "usd") && (type == "rupees") || (type == "inr")){getINR()}
        if ((second == "rupees") || (second == "inr") && (type == "dollars") || (type == "usd")){getUSD()}
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
	func getCelsius(){
		ans = (firstNum-32)*(5/9)
		ans = round(ans*10)/10
	}
    func getFahrenheit(){
        ans = firstNum*(9/5)+32
        ans = round(ans*10)/10
    }
    func getKelvin(){
        ans = (firstNum+459.67)*(5/9)
        ans = round(ans*10)/10
    }
    func getFahrenheitK(){
        ans = (firstNum*(9/5))-459.67
        ans = round(ans*10)/10
    }
    func getMiles(){
        ans = firstNum*0.62137119
        ans = round(ans*10)/10
    }
    func getMetersToMiles(){
        ans = (firstNum/1000)/1.6
        ans = round(ans*10)/10
    }
    func getKm(){
        ans = firstNum/0.62137119
        ans = round(ans*10)/10
    }
    func getINR(){
        ans = firstNum*65.68
        ans = round(ans*10)/10
    }
    func getUSD(){
        ans = firstNum/65.68
        ans = round(ans*10)/10
    }
    
    func findNum(){
        if (first.range(of: "^") != nil) {
            equation = first;
        }
        if (first.range(of: "/") != nil) {
            fraction = first;
        }
        else{
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
    
    
    func getDerivitive() -> String{
        var highDegree = 0;
        let chars = Array(equation)
        let separators = CharacterSet(charactersIn: "+,-")
        let nomials = equation.components(separatedBy: separators)
        for i in 0...chars.count-1{
            if(chars[i] == "^"){
                if(Int(String(chars[i+1]))! > highDegree){
                    highDegree = Int(String(chars[i+1]))!
                }
            }
        }
        var noms = Array<String>(repeating: "", count:nomials.count)
        var i = 0
        for nom in nomials{
            if (nom.range(of: "^") != nil){
                var parts = nom.components(separatedBy: "^")
                if (parts[0].range(of: "x") != nil){
                    parts[0] = parts[0].replacingOccurrences(of: "x", with: "", range: nil)
                    parts[0] = String(Int(parts[0])!*Int(parts[1])!) + "x"
                    parts[1] = String(Int(parts[1])!-1)
                }
                else {parts[0] = ""}
                noms[i] = (parts.joined(separator: "^"))
                i = i + 1
            }
            
        }
        equation = noms.joined(separator: "+")
        return String(equation)
        
    }
    
    func simplify() -> String{
        let parts = fraction.components(separatedBy: "/")
        var num = Int(parts[0])!
        var den = Int(parts[1])!
        var i = 2
        while(i <= num && i <= den){
            if(Double(num-((num / i)*i)) < 0.1 && Double(den-((den / i)*i)) < 0.1){
                num = num / i
                den = den / i
            }
            else {i = i+1}
        }
        if (den == 1){
            return "\(num)"
        }
        return "\(num)/\(den)"
    }
    
    func toFraction() -> String{
        let hold = Int(firstNum * 9699690)
        fraction = "\(hold)/9699690"
        return simplify()
    }
    
}


