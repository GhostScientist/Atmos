//
//  ViewController.swift
//  Atmos
//
//  Created by Dakota Cantina on 3/6/20.
//  Copyright © 2020 Dakota Cantina. All rights reserved.
//

import UIKit
import CoreLocation

protocol ChangedLocationDelegate {
    func cityDidChange(cityName : String)
}

class WeatherViewController: UIViewController, CLLocationManagerDelegate {
    
    let api_key = "333cb06e29556dbe8a456e060cc40f9b"
    
    lazy var helper : WeatherHelper = WeatherHelper()
    
    // IB Outlets + Actions
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var weatherImageView: UIImageView!
    @IBOutlet weak var locationLabel: UILabel!
    
    var locationManager: CLLocationManager?
    
    @IBAction func changeCityTapped(_ sender: UIButton) {
        let secondVC = storyboard?.instantiateViewController(withIdentifier: "changeCityVC") as! ChangeCityViewController
        secondVC.delegate = self // is this needed?
        self.present(secondVC, animated:true, completion:nil)
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        print("Hello")
        
        locationManager = CLLocationManager()
        locationManager?.delegate = self
        locationManager?.requestWhenInUseAuthorization()
        locationManager?.requestLocation()
    }
    
    func updateUIFrom(_ reading: WeatherReading) {
        temperatureLabel.text = "\(reading.main.farenheitString)"
        locationLabel.text = reading.name
        weatherImageView.image = UIImage(imageLiteralResourceName: reading.weatherIconName)
    }
    
    func getWeatherFor(_ params: [String : String]) {
        helper.getWeatherDataFor(params) { (reading) in
            print("Updated weather data for \(reading.name)")
            print("Temperature \(reading.main.farenheitString)")
            
            self.updateUIFrom(reading)
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.first else { return }
        
        print("Attempting to get weather details..")
        
        let params = [
            "lon": "\(location.coordinate.longitude)",
            "lat": "\(location.coordinate.latitude)",
            "appid": api_key
        ]
        
        getWeatherFor(params)
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Failed to get user location: \(error)")
    }
}

extension WeatherViewController : ChangedLocationDelegate {
    func cityDidChange(cityName : String) {
        print("Changed city to \(cityName)")
        let params = [
            "q" : cityName,
            "appid" : api_key
        ]
        
        helper.getWeatherDataFor(params) { (reading) in
            self.updateUIFrom(reading)
        }
    }
}

