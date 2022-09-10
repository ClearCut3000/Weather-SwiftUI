//
//  ForecastViewModel.swift
//  Weather-SwiftUI
//
//  Created by Николай Никитин on 08.09.2022.
//

import Foundation
import CoreLocation

@MainActor final class ForecastViewModel: ObservableObject {

  //MARK: - Properties
  @Published var cityName = ""
  @Published var cityCountry = ""
  @Published var citySunrise = ""
  @Published var citySunset = ""
  
  var forecast: Forecast?
  @Published var imageURL: URL?
  @Published var tempMin = 0
  @Published var tempMax = 0
  @Published var main = ""
  @Published var description = ""

  @Published var calDate = "10/10/2022"
  @Published var visibility = 10000
  @Published var pressure = 220
  @Published var humidity = 40
  @Published var windSpeed = 1.2
  @Published var windDirection = "ENE"
  @Published var cloudiness = 80
  var location = [33.33, 44.44]

  //MARK: - Methods
  func getForecast(for locationName: String) {
    print(locationName)
    LocationManager.shared.getCoordinates(for: locationName) { result in
      switch result {
      case .success(let coordinates):
        self.location = coordinates
        print(self.location)
      case .failure(let error):
        print(error)
      }
    }

    Task {
      do {
        forecast = try await NetworkManager.shared.getForecast(for: location)
        if let forecast = forecast {
          print("Model configured")
          configureViewModel(with: forecast)
        }
      } catch {
        if let forecastError = error as? WeatherError {
          switch forecastError {
          case .invalidURL:
            print(forecastError.localizedDescription)
          case .invalidResponse:
            print(forecastError.localizedDescription)
          case .invalidData:
            print(forecastError.localizedDescription)
          case .unableToComplete:
            print(forecastError.localizedDescription)
          default:
            print("Unknown error!")
          }
        }
      }
    }
  }

  private func configureViewModel(with forecast: Forecast) {
    cityName = forecast.name
    cityCountry = forecast.sys.country
    citySunrise = forecast.sys.sunrise.formatted(date: .omitted, time: .shortened)
    citySunset = forecast.sys.sunset.formatted(date: .omitted, time: .shortened)
    imageURL = forecast.weather[0].iconURL
    tempMin = Int(forecast.main.tempMin - 273.15)
    tempMax = Int(forecast.main.tempMax - 273.15)
    humidity = forecast.main.humidity
    main = forecast.weather[0].main
    description = forecast.weather[0].description
    calDate = forecast.dt.formatted(date: .numeric, time: .standard)
    visibility = forecast.visibility
    pressure = forecast.main.pressure
    humidity = forecast.main.humidity
    windSpeed = forecast.wind.speed
    windDirection = degToCompass(forecast.wind.deg)
    cloudiness = forecast.clouds.all
  }

  private func degToCompass(_ deg: Int) -> String {
    let value = Int(( Double(deg) / 22.5) + 0.5)
    let array = ["N", "NNE", "NE", "ENE", "E", "ESE", "SE", "SSE", "S", "SSW", "SW", "WSW", "W", "WNW", "NW", "NNW"]
    return array[(value % 16)]
  }
}
