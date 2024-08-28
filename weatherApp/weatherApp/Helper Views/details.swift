//
//  details.swift
//  weatherApp
//
//  Created by Shady Adel on 27/08/2024.
//

import SwiftUI

struct Details: View {
    let forecasts = [
        ("Now", "cloud.sun.fill", "15°"),
        ("3PM", "cloud.fill", "15°"),
        ("4PM", "cloud.sun.fill", "14°"),
        ("5PM", "cloud.sun.fill", "13°"),
        ("6PM", "cloud.fill", "12°")
    ]
    
    var body: some View {
        VStack(alignment: .center, spacing: 20) {
            Spacer().frame(height: 10)
            ForEach(forecasts, id: \.0) { forecast in
                HStack(alignment: .center, spacing: 55) {
                    Text(forecast.0)
                        .font(.largeTitle)
                        .foregroundColor(.white)
                    
                    Image(systemName: forecast.1)
                        .foregroundColor(.white)
                        .font(.largeTitle)
                    
                    Text(forecast.2)
                        .font(.largeTitle)
                        .foregroundColor(.white)
                }
                .padding(.horizontal)
                Divider()
                    .background(Color.white)
            }
            Spacer()
        }
        .background(
            Image("morning")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .edgesIgnoringSafeArea(.all)
        )
    }
}

#Preview {
    Details()
}
