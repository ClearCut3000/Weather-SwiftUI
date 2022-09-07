//
//  Models.swift
//  Weather-SwiftUI
//
//  Created by Николай Никитин on 07.09.2022.
//

import Foundation

// MARK: - Empty
struct Forecast: Codable {
  let list: [List]
  let city: City
}

// MARK: - City
struct City: Codable {
  let name: String
  let country: String
  let population: Int
  let sunrise: Date
  let sunset: Date
}

// MARK: - List
struct List: Codable {
  let dt: Date
  let main: Main
  let weather: [Weather]
}

// MARK: - Main
struct Main: Codable {
  let tempMin: Double
  let tempMax: Double
  let humidity: Int
}

// MARK: - Weather
struct Weather: Codable {
  let main: String
  let description: String
}


