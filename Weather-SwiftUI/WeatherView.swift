//
//  WeatherView.swift
//  Weather-SwiftUI
//
//  Created by Николай Никитин on 19.08.2022.
//

import SwiftUI

struct WeatherView: View {
  //MARK: - Properties
  @StateObject private var viewModel = ForecastViewModel()
  @State private var locationName: String = ""

  //MARK: - Main View
  var body: some View {
    ZStack {
      BackgroundView()
      VStack {
        HStack {
          TextField("Enter location here", text: $locationName)
          Button {
            Task {
              await viewModel.getCoordinates(for: locationName)
              await viewModel.getForecast()
            }
          } label: {
            Image(systemName: "magnifyingglass.circle")
              .resizable()
              .scaledToFit()
              .frame(width: 35, height: 35)
          }
        }
        .padding(10)
        .overlay(RoundedRectangle(cornerRadius: 16)
                  .stroke(.blue, lineWidth: 2)
        )
        .frame(maxWidth: 290, minHeight: 40)
        CityTextView(cityName: viewModel.cityName,
                     cityCountry: viewModel.cityCountry,
                     citySunrise: viewModel.citySunrise,
                     citySunset: viewModel.citySunset)

        MainWeatherStackView(imageURL: viewModel.imageURL ?? URL(string: "\(StaticString("https://openweathermap.org/img/wn/10d@2x.png"))")!,
                             tempMin: viewModel.tempMin,
                             tempMax: viewModel.tempMax,
                             main: viewModel.main,
                             description: viewModel.description)

        WeatherDayView(calDate: viewModel.calDate,
                       visibility: viewModel.visibility,
                       pressure: viewModel.pressure,
                       humidity: viewModel.humidity,
                       windSpeed: viewModel.windSpeed,
                       windDirection: viewModel.windDirection,
                       cloudiness: viewModel.cloudiness)
      }
    }
  }

  //MARK: - Methods

  func getForecast(for location: String) {
    
  }
}

//MARK: - Preview
struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    WeatherView()
  }
}


struct BackgroundView: View {
  var body: some View {
    LinearGradient(gradient: Gradient(colors: [.blue, Color("lightBlue")]),
                   startPoint: .topLeading,
                   endPoint: .bottomTrailing)
      .edgesIgnoringSafeArea(.all)
  }
}
