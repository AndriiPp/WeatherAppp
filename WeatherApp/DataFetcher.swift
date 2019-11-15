//
//  DataFetcher.swift
//  WeatherApp
//
//  Created by Andrii Pyvovarov on 11/15/19.
//  Copyright © 2019 Andrii Pyvovarov. All rights reserved.
//

import Foundation
protocol DataFetch {
    func getWeather(for currentCity: String, days: Int, response: @escaping (Welcome?) -> Void)
}
class DataFetcher : DataFetch {
    
    
    var networking : Networking
    
    init(networking : Networking = NetworkingService()){
        self.networking = networking
    }
    func getWeather(for currentCity: String, days: Int, response: @escaping (Welcome?) -> Void)  {
        networking.getRequest(for: currentCity, days: days) { (data, error) in
            if let error = error {
                print(error.localizedDescription)
                response(nil)
            }
            let decoder = JSONDecoder()
            guard let data = data else {return}
            let decoded = try? decoder.decode(Welcome.self, from: data)
            response(decoded)
        }
    }
    
}
