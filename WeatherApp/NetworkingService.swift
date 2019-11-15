//
//  NetworkingService.swift
//  WeatherApp
//
//  Created by Andrii Pyvovarov on 11/15/19.
//  Copyright © 2019 Andrii Pyvovarov. All rights reserved.
//

import UIKit
protocol Networking {
    func getRequest(for currentCity: String, days: Int, completion: @escaping (Data?, Error?) -> Void)
}
class NetworkingService : Networking {
    
    func getRequest(for currentCity: String, days: Int, completion: @escaping (Data?, Error?) -> Void){
        let apiReques = requestAPI.getWeather(city: currentCity, days: String(days))
        let task = createDataTask(from: apiReques.request, completion: completion)
        task.resume()
        
    }
        private func createDataTask(from requst: URLRequest, completion: @escaping (Data?, Error?) -> Void) -> URLSessionDataTask {
            return URLSession.shared.dataTask(with: requst, completionHandler: { (data, response, error) in
                DispatchQueue.main.async {
                    completion(data, error)
                }
            })
        }
}
