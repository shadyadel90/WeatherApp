//
//  DetailsViewModel.swift
//  weatherApp
//
//  Created by Shady Adel on 28/08/2024.
//

import Foundation

class DetailsViewModel: ObservableObject {
    @Published var filteredForecasts: [hour] = []
    
    var isDaytime: Bool {
        let hour = Calendar.current.component(.hour, from: Date())
        return hour >= 6 && hour < 18
    }
    
    func filterForecasts(allDay: [hour]) {
        guard !allDay.isEmpty else { return }
        
        let now = Date()
        let currentEpoch = Int(now.timeIntervalSince1970)
        
        // Find the current hour or next closest hour
        guard let startIndex = allDay.firstIndex(where: { Int($0.time_epoch) >= currentEpoch }) else { return }
        
        var filtered: [hour] = []
        
        // Add "Now" as the first item
        filtered.append(allDay[startIndex])
        
        // Add every 3 hours from the remaining items
        var index = startIndex + 1
        while index < allDay.count {
            filtered.append(allDay[index])
            index += 2
        }
        
        self.filteredForecasts = filtered
    }
    
    func hourIndex(hour: hour) -> String {
        let date = Date(timeIntervalSince1970: TimeInterval(hour.time_epoch))
        let formatter = DateFormatter()
        formatter.dateFormat = "h a"
        let formattedDate = formatter.string(from: date)
        
        return formattedDate
    }
}
