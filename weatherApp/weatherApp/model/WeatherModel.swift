//
//  WeatherModel.swift
//  weatherApp
//
//  Created by Shady Adel on 28/08/2024.
//

import Foundation



struct Location: Codable {
    let name: String
}
struct condition: Codable {
    let text: String
    let icon: String
}

struct current: Codable {
    let temp_c: Double
    let condition: condition
    let pressure_mb: Double
    let humidity: Double
    let feelslike_c: Double
    let vis_km: Double
}

struct hour :Codable {
    let time_epoch: Double
    let temp_c: Double
    let condition: condition
}

struct day: Codable {
    let maxtemp_c: Double
    let mintemp_c: Double
    let condition: condition
    
}

struct forecast: Codable {
    let date: String
    let date_epoch: Double
    let day: day
    let hour: [hour]
}

struct forecasts: Codable {
    let forecastday: [forecast]
}

struct weatherInfo: Codable {
    let location: Location
    let current: current
    let forecast: forecasts
    
}
