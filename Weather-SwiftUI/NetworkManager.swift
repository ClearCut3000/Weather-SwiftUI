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



  func getForecast() async throws -> Forecast {
    guard let url = URL(string: baseURL + latitudeURL + String(55.758664) + longitudeURL + String(37.619292) + apiKey) else {
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
