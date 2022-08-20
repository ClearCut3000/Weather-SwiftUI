//
//  ContentView.swift
//  Weather-SwiftUI
//
//  Created by Николай Никитин on 19.08.2022.
//

import SwiftUI

struct ContentView: View {

  //MARK: - Main View
  var body: some View {
    ZStack {
      BackgroundView(topColor: .blue,
                     bottomColor: Color("lightBlue"))
      VStack {
        CityTextView(cityName: "Cupertino, CA")
        MainWeatherStackView(imageName: "cloud.sun.fill",
                             temperature: 76)

        HStack(spacing: 20) {
          WeatherDayView(dayOfWeek: "TUE",
                         imageName: "cloud.sun.fill",
                         temperature: 74)

          WeatherDayView(dayOfWeek: "WED",
                         imageName: "cloud.rain.fill",
                         temperature: 65)

          WeatherDayView(dayOfWeek: "THU",
                         imageName: "cloud.fill",
                         temperature: 70)

          WeatherDayView(dayOfWeek: "FRI",
                         imageName: "sun.max.fill",
                         temperature: 72)

          WeatherDayView(dayOfWeek: "SAT",
                         imageName: "wind",
                         temperature: 69)
        }
        Spacer()

        Button {
          // TODO: add action
        } label: {
          WeatherButton(title: "Change day time",
                        textColor: .blue,
                        backgroundColor: .white)
        }
        Spacer()
      }
    }
  }
}

//MARK: - Preview
struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}

//MARK: - Subview's
struct WeatherDayView: View {
  var dayOfWeek: String
  var imageName: String
  var temperature: Int

  var body: some View {
    VStack {
      Text(dayOfWeek)
        .font(.system(size: 16, weight: .medium, design: .default))
        .foregroundColor(.white)
      Image(systemName: imageName)
        .renderingMode(.original)
        .resizable()
        .aspectRatio(contentMode: .fit)
        .frame(width: 40, height: 40)
      Text("\(temperature)°")
        .font(.system(size: 28, weight: .medium, design: .default))
        .foregroundColor(.white)
    }
  }
}

struct BackgroundView: View {
  var topColor: Color
  var bottomColor: Color

  var body: some View {
    LinearGradient(gradient: Gradient(colors: [topColor, bottomColor]),
                   startPoint: .topLeading,
                   endPoint: .bottomTrailing)
      .edgesIgnoringSafeArea(.all)
  }
}

struct CityTextView: View {
  var cityName: String

  var body: some View {
    Text(cityName)
      .font(.system(size: 32, weight: .medium, design: .default))
      .foregroundColor(.white)
      .padding()
  }
}

struct MainWeatherStackView: View {
  var imageName: String
  var temperature: Int

  var body: some View {
    VStack(spacing: 8) {
      Image(systemName: imageName)
        .renderingMode(.original)
        .resizable()
        .aspectRatio(contentMode: .fit)
        .frame(width: 180, height: 180)
      Text("\(temperature)°")
        .font(.system(size: 70, weight: .medium, design: .default))
        .foregroundColor(.white)
    }
    .padding(.bottom, 40)
  }
}
