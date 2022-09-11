//
//  LocationManager.swift
//  Weather-SwiftUI
//
//  Created by Николай Никитин on 08.09.2022.
//

import Foundation
import CoreLocation

class LocationManager {

  static let shared = LocationManager()

  private init() {}

  func getCoordinates(for location: String) async throws -> [Double] {
    let geocoder = CLGeocoder()
    let placemark = try await geocoder.geocodeAddressString(location).first
    guard let coordinates = placemark?.location?.coordinate else {
      throw WeatherError.clGeocoderError
    }
    return [coordinates.latitude, coordinates.longitude]
  }
}
