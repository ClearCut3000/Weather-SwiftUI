//
//  Models.swift
//  Weather-SwiftUI
//
//  Created by Николай Никитин on 07.09.2022.
//

import Foundation

// MARK: - Forecast
struct Forecast: Decodable {
  let weather: [Weather]
  let main: Main
  let visibility: Int
  let wind: Wind
  let clouds: Clouds
  let dt: Date
  let sys: Sys
  let name: String
}

// MARK: - Clouds
struct Clouds: Decodable {
  let all: Int
}

// MARK: - Main
struct Main: Decodable {
  let tempMin: Double
  let tempMax: Double
  let pressure: Int
  let humidity: Int
}

// MARK: - Sys
struct Sys: Decodable {
  let country: String
  let sunrise, sunset: Date
}

// MARK: - Weather
struct Weather: Decodable {
  let main: String
  let description: String
  let icon: String
  var iconURL: URL? {
    URL(string: "https://openweathermap.org/img/wn/\(icon)@2x.png")
  }
}

// MARK: - Wind
struct Wind: Decodable {
  let speed: Double
  let deg: Int
}

