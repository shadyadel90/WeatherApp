//
//  details.swift
//  weatherApp
//
//  Created by Shady Adel on 27/08/2024.
//
import SwiftUI

struct Details: View {
    @StateObject private var viewModel = DetailsViewModel()
    var allDay: [hour]
    
    var body: some View {
        VStack(alignment: .center, spacing: 20) {
            Spacer().frame(height: 10)
            ScrollView {
                if viewModel.filteredForecasts.isEmpty {
                    Text("No forecast data available")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                } else {
                    ForEach(viewModel.filteredForecasts.prefix(6), id: \.time_epoch) { hour in
                        HStack(alignment: .center, spacing: 55) {
                            Text(viewModel.hourIndex(hour: hour))
                                .font(.largeTitle)
                                .foregroundColor(.white)
                            
                            AsyncImage(url: URL(string: "https:\(hour.condition.icon)")) { image in
                                image
                                    .resizable()
                                    .scaledToFit()
                            } placeholder: {
                                Image(systemName: "photo")
                                    .resizable()
                                    .scaledToFit()
                            }
                            .foregroundColor(.white)
                            .font(.largeTitle)
                            
                            Text("\(Int(hour.temp_c))°")
                                .font(.largeTitle)
                                .foregroundColor(.white)
                        }
                        .padding(.horizontal)
                        Divider()
                            .background(Color.white)
                    }
                }
            }
            Spacer()
        }
        .background(
            Image("morning")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .edgesIgnoringSafeArea(.all)
        )
        .onAppear {
            viewModel.filterForecasts(allDay: allDay)
        }
    }
}

#Preview {
    Details(allDay: [
        hour(time_epoch: 1700000000, temp_c: 22, condition: condition(text: "Clear", icon: "sun.max")),
        hour(time_epoch: 1700003600, temp_c: 20, condition: condition(text: "Partly Cloudy", icon: "cloud.sun")),
        hour(time_epoch: 1700007200, temp_c: 18, condition: condition(text: "Cloudy", icon: "cloud")),
        hour(time_epoch: 1700010800, temp_c: 16, condition: condition(text: "Showers", icon: "cloud.rain")),
        hour(time_epoch: 1700014400, temp_c: 14, condition: condition(text: "Thunderstorm", icon: "cloud.bolt")),
        hour(time_epoch: 1700018000, temp_c: 13, condition: condition(text: "Snow", icon: "snow")),
        hour(time_epoch: 1700021600, temp_c: 12, condition: condition(text: "Fog", icon: "cloud.fog"))
    ])
}
