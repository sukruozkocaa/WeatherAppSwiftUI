//
//  WelcomeView.swift
//  WeatherApp
//
//  Created by Şükrü Özkoca on 2.03.2023.
//

import SwiftUI
import CoreLocationUI

struct WelcomeView: View {
    @EnvironmentObject var locationManager: LocationManager
    var body: some View {
       
        VStack {
            VStack(spacing: 20) {
                AsyncImage(url: URL(string: "https://nordicapis.com/wp-content/uploads/5-Best-Free-and-Paid-Weather-APIs-2019-e1587582023501.png")) { image in
                     image
                        .resizable()
                        .aspectRatio(contentMode:.fit)
                        .frame(width: 350)
                        .cornerRadius(50)
                        .padding(50)
                } placeholder: {
                    ProgressView()
                }
                Text("Welcome to the Weather App")
                    .font(.custom("GillSans-Bold", size: 22))
                Text("Please share your current location to get the weather in your area")
                    .padding()
               
            }
            .multilineTextAlignment(.center)
            .padding()
            LocationButton(.shareCurrentLocation) {
                locationManager.requestLocation()
            }
            .cornerRadius(30)
            .symbolVariant(.fill)
            .foregroundColor(.white)
            .padding(10)
         }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
  
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}
