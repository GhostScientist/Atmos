//
//  File.swift
//  Atmos
//
//  Created by Dakota Cantina on 3/6/20.
//  Copyright © 2020 Dakota Cantina. All rights reserved.
//

import Foundation

class WeatherReading : Codable {
    // Model Object
    
    var name : String
    var main : Main
    var weather : [Weather]
    var weatherIconName : String {
        get {
            getWeatherIcon()
        }
    }
    
    struct Weather : Codable {
        var id: Int
    }
    
    struct Main : Codable {
        var temp : Double
    }
    
    func getWeatherIcon() -> String {
        
        switch (self.weather[0].id) {
    
        case 0...300 :
            return "tstorm1"
        
        case 301...500 :
            return "light_rain"
        
        case 501...600 :
            return "shower3"
        
        case 601...700 :
            return "snow4"
        
        case 701...771 :
            return "fog"
        
        case 772...799 :
            return "tstorm3"
        
        case 800 :
            return "sunny"
        
        case 801...804 :
            return "cloudy2"
        
        case 900...903, 905...1000  :
            return "tstorm3"
        
        case 903 :
            return "snow5"
        
        case 904 :
            return "sunny"
        
        default :
            return "dunno"
        }

    }
    
}
