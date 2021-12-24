//
//  WeatherModel.swift
//  Surfistas Prateados
//
//  Created by Beto Moresca on 24/12/2021.
//

import Foundation

struct WeatherModel {
    let conditionId: Int
    let cityName: String
    let temperature: Double
    let minTemperature: Double
    let maxTemperature: Double
    let latitude: Double
    let longitude: Double
    let airPressure: Int
    let airHumidity: Int
    let windSpeed: Double
    let windDirection: Int
    
    var conditionName: String {
        switch conditionId {
        case 200...232:
            return "cloud.bolt"
        case 300...321:
            return "cloud.drizzle"
        case 500...531:
            return "cloud.rain"
        case 600...622:
            return "cloud.snow"
        case 701...781:
            return "cloud.fog"
        case 800:
            return "sun.max"
        case 801...804:
            return "cloud"
        default:
            return "cloud"
        }
    }
    
    var windCoordinate: String {

        let coordinates = ["NNE", "NE", "ENE", "E", "ESE", "SE", "SSE", "S", "SSW", "SW", "WSW", "W", "WNW", "NW", "NNW", "N"]
        let string = Double(windDirection)/22.5
        
        let n = Int(string)
        
        return coordinates[n-1]
    }
    
}
