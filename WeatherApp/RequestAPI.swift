//
//  RequestAPI.swift
//  WeatherApp
//
//  Created by Andrii Pyvovarov on 11/15/19.
//  Copyright © 2019 Andrii Pyvovarov. All rights reserved.
//

import Foundation

enum requestAPI {
     case getWeather(city: String, days: String)
     case getSpecial(code: Int)
    
}
extension requestAPI {
    
    //MARK :- Configuration url
    var queryParams: [URLQueryItem] {
        var query: [URLQueryItem] = []
        switch self {
        case .getWeather(let city, let days):
            query.append(URLQueryItem.init(name: "q", value: city))
            query.append(URLQueryItem.init(name: "cnt", value: days))
            query.append(URLQueryItem.init(name: "mode", value: "json"))
            query.append(URLQueryItem.init(name: "units", value: "metric"))
            query.append(URLQueryItem.init(name: "appid", value: "b5689ff6944f5c600737608a0be51f05"))
            
             return query
       case .getSpecial(_):
        query.append(URLQueryItem.init(name: "q", value: "London"))
        query.append(URLQueryItem.init(name: "mode", value: "json"))
        
        return query
        }
    }
    
    
    private var componect: URLComponents {
        var componects = URLComponents()
        componects.scheme = "https"
        componects.host = "api.openweathermap.org"
        componects.path = "/data/2.5/forecast/daily"
        
        switch self {
            
        case .getWeather:
            componects.queryItems = queryParams
            return componects
        default:
            break
        }
        
        return componects
    }
    
   public var request: URLRequest {
        var request = URLRequest.init(url: componect.url!, cachePolicy: .returnCacheDataElseLoad, timeoutInterval: 30)
        
        switch self {
        case .getWeather:
            request.httpMethod = "GET"
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
            return request
        default:
            return request
        }
    }
}
