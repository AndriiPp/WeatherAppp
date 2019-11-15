//
//  Weather.swift
//  WeatherApp
//


import Foundation

// MARK: - Welcome
struct Welcome: Codable {
    let cod: String?
    let city: City?
    let cnt: Int?
    let list: [List]?
}

// MARK: - City
struct City: Codable {
    let geonameID: Int?
    let name: String?
    let lat, lon: Double?
    let country, iso2, type: String?
    let population: Int?

    enum CodingKeys: String, CodingKey {
        case geonameID = "geoname_id"
        case name, lat, lon, country, iso2, type, population
    }
}

// MARK: - List
struct List: Codable {
    let dt: Int?
    let temp: Temp?
    let pressure: Double?
    let humidity: Int?
    let weather: [Weather]?
    let speed: Double?
    let deg, clouds: Int?
    let snow: Double?
}

// MARK: - Temp
struct Temp: Codable {
    let day, min, max, night: Double?
    let eve, morn: Double?
}

// MARK: - Weather
struct Weather: Codable {
    let id: Int?
    let main, weatherDescription, icon: String?

    enum CodingKeys: String, CodingKey {
        case id, main
        case weatherDescription = "description"
        case icon
    }
}
