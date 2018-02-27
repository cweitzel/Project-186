//
//  Test.swift
//  Team group 6 186
//
//  Created by Taylor Weil on 2/27/18.
//  Copyright © 2018 Taylor Weil. All rights reserved.
// y

import Foundation
import UIKit

class Test  {
    
    var input = "DefaultIn"
    var output = "DefaultOut"
    
    //Initilizer takes input from ViewController and tests
    init(input: String){
        self.input = input
        
        //Put all new methurds below to be tested
        testHello()
        
    }
 
    //Returns text output
    func getOut() -> String {
        return output;
    }
    
    
    func testHello() {
        if (input == "Hello"){
            output = "Hello! How are you?";
        }
    }
    
    
}
