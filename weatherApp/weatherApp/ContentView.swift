//
//  ContentView.swift
//  weatherApp
//
//  Created by Shady Adel on 27/08/2024.
//

import SwiftUI

struct ContentView: View {
    @State private var weatherArray: weatherInfo?
    
    var isDaytime: Bool {
        let hour = Calendar.current.component(.hour, from: Date())
        return hour >= 6 && hour < 18
    }
    
    var body: some View {
        NavigationView {
            VStack {
                if let weather = weatherArray {
                    Spacer()
                    BasicInfo(
                        name: weather.location.name,
                        temp: "\(Int(weather.current.temp_c))",
                        status: weather.current.condition.text,
                        hTemp: "\(Int(weather.forecast.forecastday[0].day.maxtemp_c))",
                        mTemp: "\(Int(weather.forecast.forecastday[0].day.mintemp_c))",
                        icon: "https:\(weather.current.condition.icon)"
                    )
                    
                    VStack(alignment: .leading) {
                        Text("3 Days Forecast").bold().font(.title3)
                        Spacer().frame(height: 4)
                        Divider()
                        ForEach(weather.forecast.forecastday.prefix(3), id: \.date) { dayForecast in
                            NavigationLink(destination: Details()) {
                                VStack {
                                    threeDaysList(
                                        day: "\(dayForecast.date_epoch)", 
                                        icon: "https:\(dayForecast.day.condition.icon)",
                                        htemp: "\(Int(dayForecast.day.maxtemp_c))",
                                        mtemp: "\(Int(dayForecast.day.mintemp_c))"
                                    )
                                    Divider()
                                }
                                .foregroundColor(isDaytime ? .black : .white)
                                .background(Color.clear)
                            }
                        }
                    }
                    
                    Spacer().frame(height: 20)
                    
                    HStack {
                        specialQuality(name: "VISIBILITY", value: "\(Int(weather.current.vis_km)) KM")
                        Spacer()
                        specialQuality(name: "HUMIDITY", value: "\(Int(weather.current.humidity))%")
                    }.frame(height: 120)
                    
                    HStack {
                        specialQuality(name: "WIND", value: "\(Int(weather.current.feelslike_c)) KM/H")
                        Spacer()
                        specialQuality(name: "PRESSURE", value: "\(Int(weather.current.pressure_mb)) hPa")
                    }.frame(height: 120)
                    
                    Spacer()
                } else {
                  
                    Text("Loading...")
                        .foregroundColor(.gray)
                }
            }
            .padding()
            .foregroundStyle(isDaytime ? .white : .black)
            .background(
                Image(isDaytime ? "morning" : "night")
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()
            )
        }
        .onAppear {
            NetworkService.fetchData { weather in
                DispatchQueue.main.async {
                    self.weatherArray = weather
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
