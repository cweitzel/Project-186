
//
//  File.swift
//  Team group 6 186
//
//  Created by Taylor Weil on 4/17/18.
//  Copyright © 2018 Taylor Weil. All rights reserved.
//

import Foundation

class User{
	var username = ""
	var password = ""
	/*
	func init(){
		
	}
	*/
	func getUsername() -> String{
		return username;
	}
	
	func assignUsername(name: String){
		username = name;
	}
    
    
}
