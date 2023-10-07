//
//  ContentView.swift
//  WeatherApp
//
//  Created by Denis DRAGAN on 5.10.2023.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isNight = false
    
    var body: some View {
        ZStack {
            
            // Background color
            BackgroundView(isNight: $isNight)
            
            VStack() {
                CityTextView(cityName: "Cupertino, CA")
                
                MainWeatherView(imageName: isNight ? "moon.stars.fill" : "cloud.sun.fill",
                                temparature: isNight ? 50 : 76)
                
                HStack(spacing: 25) {
                    
                    WeatherDayView(dayOfWeek: "TUE",
                                   imageName: "cloud.sun.fill",
                                   temparature: 74)
                    
                    WeatherDayView(dayOfWeek: "WED",
                                   imageName: "sun.max.fill",
                                   temparature: 88)
                    
                    WeatherDayView(dayOfWeek: "THU",
                                   imageName: "wind.snow",
                                   temparature: 55)
                    
                    WeatherDayView(dayOfWeek: "FRI",
                                   imageName: "sunset.fill",
                                   temparature: 60)
                    
                    WeatherDayView(dayOfWeek: "SAT",
                                   imageName: "snow",
                                   temparature: 25)
                }
                Spacer()
                Button {
                    isNight.toggle()
                } label: {
                    WeatherButton(title: "Change Day Time",
                                  textColor: .blue,
                                  backgroundColor: .white)
                }
                Spacer()
            }
        }
    }
}

#Preview {
    ContentView()
}

struct WeatherDayView: View {
    
    var dayOfWeek: String
    var imageName: String
    var temparature: Int
    
    var body: some View {
        
        VStack() {
            Text(dayOfWeek)
                .font(.system(size: 16, weight: .medium))
                .foregroundStyle(.white)
            
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)
            
            Text("\(temparature)°")
                .font(.system(size: 24, weight: .medium))
                .foregroundStyle(.white)
        }
    }
}

struct BackgroundView: View {
    
    @Binding var isNight: Bool
    
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [isNight ? .black : .blue,
                                                   isNight ? .gray : .lightBlue]),
                       startPoint: .topLeading,
                       endPoint: .bottomTrailing)
        .ignoresSafeArea(edges: .all)
    }
}

struct CityTextView: View {
    
    var cityName: String
    
    var body: some View {
        Text(cityName)
            .font(.system(size: 32, weight: .medium, design: .default))
            .foregroundStyle(.white)
            .padding()
    }
}

struct MainWeatherView: View {
    
    var imageName: String
    var temparature: Int
    
    var body: some View {
        VStack(spacing: 10) {
            Image(systemName: imageName)
                .renderingMode(.original) // The picture becomes colorful
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180, height: 180)
            Text("\(temparature)°")
                .font(.system(size: 60, weight: .medium))
                .foregroundStyle(.white)
        }
        .padding(.bottom, 50)
    }
}
