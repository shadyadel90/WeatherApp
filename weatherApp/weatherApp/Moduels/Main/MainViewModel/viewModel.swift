//
//  viewModel.swift
//  weatherApp
//
//  Created by Shady Adel on 28/08/2024.
//

import Foundation

import SwiftUI

class WeatherViewModel: ObservableObject {
    @Published var weatherArray: weatherInfo?
    
    func fetchWeather() {
        NetworkService.fetchData(Constants.ApiUrl) { [weak self] weather,error in
            
            DispatchQueue.main.async {
                self?.weatherArray = weather
                
            }
            
        }
    }
}
