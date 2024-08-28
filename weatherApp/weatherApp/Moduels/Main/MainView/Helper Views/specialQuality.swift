//
//  specialQuality.swift
//  weatherApp
//
//  Created by Shady Adel on 27/08/2024.
//

import SwiftUI

struct specialQuality: View {
    var name: String
    var value: String
    var body: some View {
        VStack{
            Text(name)
            Spacer()
            Text(value).bold().font(.largeTitle)
        }
        .frame(width: 150,height: 80)
    }
}

#Preview {
    specialQuality(name: "VISIBILTY", value: "10 KM")
}
