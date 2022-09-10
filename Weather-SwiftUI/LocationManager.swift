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

  func getCoordinates(for location: String, completion: @escaping (Result<[Double], WeatherError>) -> Void) {
    CLGeocoder().geocodeAddressString(location) { placemarks, error in
      guard error == nil else {
        completion(.failure(.clGeocoderError))
        return
      }
      guard let latitude = placemarks?.first?.location?.coordinate.latitude,
         let longitude = placemarks?.first?.location?.coordinate.longitude else {
           completion(.failure(.coordinatesError))
           return
      }
      completion(.success([latitude, longitude]))
    }
  }
}
