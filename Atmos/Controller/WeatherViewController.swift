//
//  ViewController.swift
//  Atmos
//
//  Created by Dakota Cantina on 3/6/20.
//  Copyright © 2020 Dakota Cantina. All rights reserved.
//

import UIKit

protocol ChangedLocationDelegate {
    func cityDidChange(cityName : String)
}

class WeatherViewController: UIViewController {
    
    let api_key = "333cb06e29556dbe8a456e060cc40f9b"
    
    lazy var helper : WeatherHelper = WeatherHelper()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

}

extension WeatherViewController : ChangedLocationDelegate {
    func cityDidChange(cityName : String) {
        print("Changed city to \(cityName)")
        // TODO Request weather for City.
        // Handle "" case.
    }
}

