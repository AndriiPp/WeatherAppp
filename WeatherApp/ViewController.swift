//
//  ViewController.swift
//  WeatherApp
//
//  Created by Andrii Pyvovarov on 11/15/19.
//  Copyright © 2019 Andrii Pyvovarov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var request = DataFetcher()
   
    override func viewDidLoad() {
        super.viewDidLoad()
        request.getWeather(for: "London", days: 3) { (welcome) in
            guard let welcome = welcome?.list else {return}
            for i in welcome{
                print(i)
            }
        }
        }
       // Do any additional setup after loading the view.
    }
    

