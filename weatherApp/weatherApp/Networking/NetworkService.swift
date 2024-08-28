//
//  nwService.swift
//  weatherApp
//
//  Created by Shady Adel on 28/08/2024.
//

import Foundation

class NetworkService {

    static func fetchData(_ urlString: String,completionHandler: @escaping (weatherInfo?,Error?) -> Void) {
        
        guard let url = URL(string: urlString) else {
            completionHandler(nil, URLError(.badURL))
            return
        }
        
        let request = URLRequest(url: url)
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                completionHandler(nil,error)
                print(error.localizedDescription)
                return
            }
            
            guard let data = data else {
                completionHandler(nil,URLError(.badServerResponse))
                return
            }
            
            do {
                let result = try JSONDecoder().decode(weatherInfo.self, from: data)
                completionHandler(result,nil)
            } catch let error {
                print(error.localizedDescription)
                completionHandler(nil,error)
            }
        }.resume()
    }
}
