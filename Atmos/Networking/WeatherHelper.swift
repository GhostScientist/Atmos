//
//  WeatherHelper.swift
//  Atmos
//
//  Created by Dakota Cantina on 3/6/20.
//  Copyright © 2020 Dakota Cantina. All rights reserved.
//

import Foundation

class WeatherHelper {
    
    let openWeatherAPIURL = "http://api.openweathermap.org/data/2.5/weather?"
    
    func getWeatherDataFor(_ parameters: [String : String], completion: @escaping (WeatherReading) -> ()) {
        
        let urlParams = parameters.compactMap({ (key, value) -> String in
          return "\(key)=\(value)"
        }).joined(separator: "&")
         
        let requestURL = openWeatherAPIURL + urlParams
        print("Requesting weather data from \(requestURL)")
        
        let session = URLSession(configuration: .default, delegate: nil, delegateQueue: .main)
        let url = URL(string: requestURL)!
        
        let task = session.dataTask(with: url) { (data, response, error) in
            do {
                let forecast = try JSONDecoder().decode(WeatherReading.self, from: data!)
                completion(forecast)
            } catch {
                print("Error \(error)")
            }
        }
        
        task.resume()
    }
}
