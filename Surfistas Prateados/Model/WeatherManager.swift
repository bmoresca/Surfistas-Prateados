//
//  WeatherManager.swift
//  Surfistas Prateados
//
//  Created by Beto Moresca on 23/12/2021.
//

import Foundation
import CoreLocation

protocol WeatherManagerDelegate {
    func didUpdateWeather(_ weatherManager: WeatherManager, weather: WeatherModel)
    func didFailwithError(error: Error)
}

struct WeatherManager {
    
    let weatherURL = "https://api.openweathermap.org/data/2.5/weather?&appid=a827fc09ddac52c4dfb25dda985d8945&units=metric"
    
    var delegate: WeatherManagerDelegate?
    
    func fetchWeather(cityName: String) {
        let urlString = "\(weatherURL)&q=\(cityName)"
        performRequest(with: urlString)
    }
    
    func fetchWeather(latitude: CLLocationDegrees, longitude: CLLocationDegrees) {
        let urlString = "\(weatherURL)&lat=\(latitude)&lon=\(longitude)"
        performRequest(with: urlString)
        
    }
    
    func performRequest(with urlString: String) {
        
        if let url = URL(string: urlString){
            
            let session = URLSession(configuration: .default)
            
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    self.delegate?.didFailwithError(error: error!)
                    return
                }
                
                if let safeData = data {
                    if let weather = self.parseJSON(safeData) {
                        self.delegate?.didUpdateWeather(self, weather: weather)
                    }
                }
            }
            
            task.resume()
        }
        
    }
    
    func parseJSON(_ weatherData: Data) -> WeatherModel? {
        let decoder = JSONDecoder()
        do {
            
            let decodedData = try decoder.decode(WeatherData.self, from: weatherData)
            let id = decodedData.weather[0].id
            let name = decodedData.name
            let temp = decodedData.main.temp
            let minTemp = decodedData.main.temp_min
            let maxTemp = decodedData.main.temp_max
            let lat = decodedData.coord.lat
            let long = decodedData.coord.lon
            let pressure = decodedData.main.pressure
            let humidity = decodedData.main.humidity
            let speed = decodedData.wind.speed
            let deg = decodedData.wind.deg
            
            let weather = WeatherModel(conditionId: id, cityName: name, temperature: temp, minTemperature: minTemp, maxTemperature: maxTemp, latitude: lat, longitude: long, airPressure: pressure, airHumidity: humidity, windSpeed: speed, windDirection: deg)
            return weather
            
        } catch {
            delegate?.didFailwithError(error: error)
            return nil
        }
    }
    
}
