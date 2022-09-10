//
//  NetworkManager.swift
//  Weather-SwiftUI
//
//  Created by Николай Никитин on 07.09.2022.
//

import Foundation

class NetworkManager {

  static let shared = NetworkManager()

  private let baseURL = "https://api.openweathermap.org/data/2.5/weather?"
  private let latitudeURL = "lat="
  private let longitudeURL = "&lon="
  private let apiKey = "&appid=06761b6a0431049058265993d29c790c"
  
  private init() {}

  func getForecast(for location: [Double]) async throws -> Forecast {
    guard location.count == 2 else {
      throw WeatherError.invalidForecastCoordinates
    }
    guard let url = URL(string: baseURL + latitudeURL + "\(location[0])" + longitudeURL + "\(location[1])" + apiKey) else {
      throw WeatherError.invalidURL
    }
    let (data, response) = try await URLSession.shared.data(from: url)
    do {
      let decoder = JSONDecoder()
      decoder.keyDecodingStrategy = .convertFromSnakeCase
      decoder.dateDecodingStrategy = .secondsSince1970
      return try decoder.decode(Forecast.self, from: data)
    } catch {
      throw WeatherError.invalidData
    }
  }
}
