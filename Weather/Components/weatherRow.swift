//
//  weatherRow.swift
//  Weather
//
//  Created by Arpit Arun Kumaar on 2022-01-15.
//

import SwiftUI

struct WeatherRow: View
{
    var logo: String
    var name: String
    var value: String
    
    var body: some View
    {
        HStack(spacing: 20)
        {
            Image(systemName: logo)
                .font(.title2)
                .frame(width: 20, height: 20)
                .padding()
                .background(Color(hue: 0.491, saturation: 0.944, brightness: 0.188, opacity: 0.792))
                        .preferredColorScheme(.dark)

            VStack(alignment: .leading, spacing: 8)
            {
                Text(name)
                    .font(.caption)
                
                Text(value)
                    .bold()
                    .font(.title)
            }
        }
    }
}

struct WeatherRow_Previews: PreviewProvider {
    static var previews: some View {
        WeatherRow(logo: "thermometer", name: "Feels like", value: "8°")
    }
}
