//
//  ContentView.swift
//  Weather
//
//  Created by Arpit Arun Kumaar on 2022-01-14.
//

import SwiftUI

struct ContentView: View {
    @StateObject var locationManager = LocationManager() // initializing
    
    var body: some View {
        VStack
        {
            if let location = locationManager.location
            {
                Text("Your current coordinates are:"
                     + "\(location.longitude)" +
                     "\(location.latitude)")
            } else
            {
                    if locationManager.isLoading
                    {
                        LoadingView()
                    }
                    else
                    {
                        WelcomeView()
                            .environmentObject(locationManager)
                    }
            }
                     
                     
            WelcomeView()
                .environmentObject(locationManager)
        }
        .background(Color(hue: 0.491, saturation: 0.944, brightness: 0.188, opacity: 0.792))
        .preferredColorScheme(.dark)
    }
}

struct ContentView_Previews: PreviewProvider
{
    static var previews: some View
    {
        ContentView()
    }
}

