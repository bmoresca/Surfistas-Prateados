//
//  WeatherData.swift
//  Surfistas Prateados
//
//  Created by Beto Moresca on 23/12/2021.
//

import Foundation

struct WeatherData: Decodable {
    let name: String
    let main: Main
    let coord: Coord
    let weather: [Weather]
    let wind: Wind
}

struct Main: Decodable {
    let temp: Double
    let temp_min: Double
    let temp_max: Double
    let pressure: Int
    let humidity: Int
}

struct Coord: Decodable {
    let lon: Double
    let lat: Double
}

struct Weather: Decodable {
    let id: Int
}

struct Wind: Decodable {
    let speed: Double
    let deg: Int
}
