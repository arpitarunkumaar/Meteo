//
//  WelcomeView.swift
//  Weather
//
//  Created by Arpit Arun Kumaar on 2022-01-14.
//

import SwiftUI
import CoreLocationUI

struct WelcomeView: View
{
    @EnvironmentObject var locationManager: LocationManager
    var body: some View
    {
        VStack
        {
            VStack(spacing: 24)
            {
                Text("Welcome to Meteo")
                    .bold().font(.title)
                Text("Please share your current location to check the weather in your area.")
                    .padding()
            }
            .multilineTextAlignment(.center)
            .padding()
            LocationButton(.shareCurrentLocation){locationManager.requestLocation()}
            .cornerRadius(24)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .symbolVariant(.fill)
        .foregroundColor(.white)
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}
