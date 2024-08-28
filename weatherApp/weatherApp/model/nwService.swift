//
//  nwService.swift
//  weatherApp
//
//  Created by Shady Adel on 28/08/2024.
//

import Foundation

class NetworkService {

    
   static func fetchData(completionHandler: @escaping (weatherInfo)->()){
        let api = "https://api.weatherapi.com/v1/forecast.json?key=2d5ed618a17c4f3d966173827242608&q=30.0444,31.2357&days=3&aqi=no&alerts=no"
        
        let url = URL(string: api)
        let request = URLRequest(url: url!)
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                print(error.localizedDescription)
            }
            
            guard let data = data else {return}
            
            do {
                let result = try JSONDecoder().decode(weatherInfo.self, from: data)
                completionHandler(result)
            }catch let error {
                print(error)
            }
        }.resume()
    }
    
}
