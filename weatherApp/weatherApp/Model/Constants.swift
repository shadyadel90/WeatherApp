//
//  Constants.swift
//  weatherApp
//
//  Created by Shady Adel on 28/08/2024.
//

import Foundation

enum Constants {
    static var ApiUrl: String {
        guard let apiKey = ProcessInfo.processInfo.environment["WEATHER_API_KEY"],
              !apiKey.isEmpty else {
            return ""
        }

        var components = URLComponents(string: "https://api.weatherapi.com/v1/forecast.json")
        components?.queryItems = [
            URLQueryItem(name: "key", value: apiKey),
            URLQueryItem(name: "q", value: "30.0444,31.2357"),
            URLQueryItem(name: "days", value: "3"),
            URLQueryItem(name: "aqi", value: "no"),
            URLQueryItem(name: "alerts", value: "no")
        ]

        return components?.url?.absoluteString ?? ""
    }
}
