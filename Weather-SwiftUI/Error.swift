//
//  Error.swift
//  Weather-SwiftUI
//
//  Created by Николай Никитин on 07.09.2022.
//

import Foundation

enum WeatherError: Error {
  case invalidURL
  case invalidResponse
  case invalidData
  case unableToComplete
}
