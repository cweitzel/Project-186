//
//  WeatherGetter.swift
//  WeatherAppNew
//
//  Created by Cole Weitzel on 4/24/18.
//  Copyright © 2018 Cole Weitzel. All rights reserved.
//

import Foundation

class WeatherGetter {
	private let openWeatherMapBaseURL = "https://api.openweathermap.org/data/2.5/weather"
	private let openWeatherMapAPIKey = "f8953ada40790bfa5e058a0563f431df"
	
	private var array: [Any] = []
	
	func getWeather(city: String) {
		
		// This is a pretty simple networking task, so the shared session will do.
		let session = URLSession.shared
		
		let weatherRequestURL = URL(string: "\(openWeatherMapBaseURL)?APPID=\(openWeatherMapAPIKey)&q=\(city)")!
		
		// The data task retrieves the data.
		let dataTask = session.dataTask(with: weatherRequestURL) {
			(data, response, error) in
			if let error = error {
				// Case 1: Error
				// We got some kind of error while trying to get data from the server.
				print("Error:\n\(error)")
			}
			else {
				// Case 2: Success
				// We got a response from the server!
				do {
					// Try to convert that data into a Swift dictionary
					let weather = try JSONSerialization.jsonObject(
						with: data!,
						options: .mutableContainers) as! [String: AnyObject]
					
					// If we made it to this point, we've successfully converted the
					// JSON-formatted weather data into a Swift dictionary.
					// Let's print its contents to the debug console.
					self.array.append(weather["dt"]!)
					print("Date and time: \(self.array[0])")
					
					self.array.append(weather["name"]!)
					print("City: \(self.array[1])")
					
					self.array.append(weather["coord"]!["lon"]!!)
					print("Longitude: \(self.array[2])")
					
					self.array.append(weather["coord"]!["lat"]!!)
					print("Latitude: \(self.array[3])")
					
					/*print("Weather ID: \(weather["weather"]![0]!["id"]!!)")
					print("Weather main: \(weather["weather"]![0]!["main"]!!)")
					print("Weather description: \(weather["weather"]![0]!["description"]!!)")
					print("Weather icon ID: \(weather["weather"]![0]!["icon"]!!)")*/
					
					self.array.append(weather["main"]!["temp"]!!)
					print("Temperature: \(self.array[4])")
					
					self.array.append(weather["main"]!["humidity"]!!)
					print("Humidity: \(self.array[5])")
					
					self.array.append(weather["main"]!["pressure"]!!)
					print("Pressure: \(self.array[6])")
					
					self.array.append(weather["clouds"]!["all"]!!)
					print("Cloud cover: \(self.array[7])")
					
					self.array.append(weather["wind"]!["deg"]!!)
					print("Wind direction: \(self.array[8]) degrees")
					
					self.array.append(weather["wind"]!["speed"]!!)
					print("Wind speed: \(self.array[9])")
					
					self.array.append(weather["sys"]!["country"]!!)
					print("Country: \(self.array[10])")
					
					self.array.append(weather["sys"]!["sunrise"]!!)
					print("Sunrise: \(self.array[11])")
					
					self.array.append(weather["sys"]!["sunset"]!!)
					print("Sunset: \(self.array[12])")
				}
				catch let jsonError as NSError {
					// An error occurred while trying to convert the data into a Swift dictionary.
					print("JSON error description: \(jsonError.description)")
				}
			}
		}
		
		// The data task is set up...launch it!
		dataTask.resume()
		sleep(2)
	}
	
	func getArray() -> Array<Any>{
		return array
	}
}
