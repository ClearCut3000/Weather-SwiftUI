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

  //MARK: - Main View
  var body: some View {
    ZStack {
      BackgroundView()
      VStack {
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
    .task {
      viewModel.getForecast()
    }
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
