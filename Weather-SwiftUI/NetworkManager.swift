//
//  NetworkManager.swift
//  Weather-SwiftUI
//
//  Created by Николай Никитин on 07.09.2022.
//

import Foundation

class NetworkManager {

  static let shared = NetworkManager()

  private let baseURL = "https://api.openweathermap.org/data/2.5/forecast?"
  private let latitudeURL = "lat="
  private let longitudeURL = "&lon="
  private let apiKey = "&appid=06761b6a0431049058265993d29c790c"

  private init() {}

  func getForecast() async throws -> Forecast {
    guard let url = URL(string: baseURL + latitudeURL + String(37.319311) + longitudeURL + String(-122.028336) + apiKey) else {
      throw WeatherError.invalidURL
    }
    print(url)
    let (data, response) = try await URLSession.shared.data(from: url)
    print(data)
    do {
      let decoder = JSONDecoder()
      decoder.keyDecodingStrategy = .convertFromSnakeCase
      return try decoder.decode(Forecast.self, from: data)
    } catch {
      print("Can't decode")
      throw WeatherError.invalidData
    }
  }

}
