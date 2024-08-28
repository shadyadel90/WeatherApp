//
//  threeDaysList.swift
//  weatherApp
//
//  Created by Shady Adel on 27/08/2024.
//

import SwiftUI

struct threeDaysList: View {
    var day: String
    var icon : String
    var htemp: String
    var mtemp: String
    
    var body: some View {
        HStack {
            Text(String.dayNameFromTimestamp(day) ?? "Today").bold().background(Color.clear).frame(maxWidth: .infinity)
            Spacer()
            AsyncImage(url: URL(string: icon))
            Spacer()
            Text("L: \(mtemp)°").bold().frame(maxWidth: .infinity)
            Text("H: \(htemp)°").bold().frame(maxWidth: .infinity)
            
        }.frame(width: 350,height: 60)
            .background(Color.clear)
            .scrollContentBackground(.hidden)
    }
}
extension String {
    // Convert Unix timestamp string to the day name
    static func dayNameFromTimestamp(_ timestampString: String) -> String? {
        guard let timestamp = Double(timestampString) else { return nil }
        let date = Date(timeIntervalSince1970: timestamp)
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEE" // Day of the week
        
        return dateFormatter.string(from: date)
    }
}

#Preview {
    threeDaysList(day: "Wed", icon: "photo", htemp: "15.2", mtemp: "6.5")
}
