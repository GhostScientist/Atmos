//
//  ChangeCityViewController.swift
//  Atmos
//
//  Created by Dakota Cantina on 3/13/20.
//  Copyright © 2020 Dakota Cantina. All rights reserved.
//

import UIKit

class ChangeCityViewController: UIViewController {
    
    var delegate : ChangedLocationDelegate!
    

    @IBOutlet weak var cityTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func onSubmitTapped(_ sender: Any) {
        guard let cityName = cityTextField.text else { return }
        delegate.cityDidChange(cityName: cityName)
        self.dismiss(animated: true, completion: nil)
    }
    

}
