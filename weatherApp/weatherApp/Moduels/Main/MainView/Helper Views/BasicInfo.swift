//
//  BasicInfo.swift
//  weatherApp
//
//  Created by Shady Adel on 27/08/2024.
//

import SwiftUI

struct BasicInfo: View {
    var name: String
    var temp: String
    var status: String
    var hTemp: String
    var mTemp: String
    var icon: String
    var body: some View {
        VStack{
            Text(name).bold().font(.largeTitle)
            Text("\(temp)°").bold().font(.title)
            Text("\(status)").font(.title2)
            HStack{
                Text("H:\(hTemp)°").font(.title2)
                Text("L:\(mTemp)°").font(.title2)
            }
           AsyncImage(url: URL(string: icon))
        }
    }
}

#Preview {
    BasicInfo(name: "Cairo",temp: "21",status: "Partly Cloudy",hTemp: "16",mTemp: "6",icon: "pencil")
}
