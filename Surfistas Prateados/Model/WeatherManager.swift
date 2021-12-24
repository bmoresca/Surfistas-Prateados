//
//  WeatherManager.swift
//  Surfistas Prateados
//
//  Created by Beto Moresca on 23/12/2021.
//

import Foundation

struct WeatherManager {
    
    let weatherURL = "https://api.openweathermap.org/data/2.5/weather?&appid=a827fc09ddac52c4dfb25dda985d8945&units=metric"
    
    func fetchWeather(cityName: String) {
        let urlString = "\(weatherURL)&q=\(cityName)"
        performRequest(urlString: urlString)
    }
    
    func performRequest(urlString: String) {
        
        if let url = URL(string: urlString){
            
            let session = URLSession(configuration: .default)
            
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    print(error!)
                    return
                }
                
                if let safeData = data {
                    self.parseJSON(weatherData: safeData)
                }
            }
            
            task.resume()
        }
        
    }
    
    func parseJSON(weatherData: Data) {
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
            
            print(weather.windCoordinate)
            print(weather.conditionName)
            
            
        } catch {
            print(error)
        }
    }
    
}
