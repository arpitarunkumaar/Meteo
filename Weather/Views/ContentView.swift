//
//  ContentView.swift
//  Weather
//
//  Created by Arpit Arun Kumaar on 2022-01-14.
//

import SwiftUI

struct ContentView: View
{
    @StateObject var locationManager = LocationManager()
    var weatherManager = WeatherManager()
    @State var weather: ResponseBody?
    
    var body: some View
    {
        VStack
        {
            if let location = locationManager.location
            {
                if let weather = weather
                {
                    WeatherView(weather: weather)
                } else {
                    LoadingView()
                        .task {
                            do
                            {
                                weather = try await weatherManager.getCurrentWeather(latitude: location.latitude, longitude: location.longitude)
                            } catch
                            {
                                print("Error getting weather: \(error)")
                            }
                        }
                }
            } else
            {
                if locationManager.isLoading
                {
                    LoadingView()
                } else
                {
                    WelcomeView()
                        .environmentObject(locationManager)
                }
            }
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

