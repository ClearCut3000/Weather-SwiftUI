//
//  CityTextView.swift
//  Weather-SwiftUI
//
//  Created by Николай Никитин on 08.09.2022.
//

import SwiftUI

struct CityTextView: View {

  var cityName = "cityName"
  var cityCountry = "cityCountry"
  var citySunrise = "citySunrise"
  var citySunset = "citySunset"

  var body: some View {
    VStack {
      Text(cityName)
        .font(.system(size: 32, weight: .light, design: .default))
        .foregroundColor(.white)
      Text(cityCountry)
        .font(.system(size: 24, weight: .light, design: .default))
        .foregroundColor(.white)
      HStack(spacing: 30) {
        HStack {
          Image(systemName: "sunrise.fill")
            .renderingMode(.original)
          Text(citySunrise)
            .font(.system(size: 16, weight: .light, design: .default))
            .foregroundColor(.white)
        }
        HStack {
          Image(systemName: "sunset.fill")
            .renderingMode(.original)
          Text(citySunset)
            .font(.system(size: 16, weight: .light, design: .default))
            .foregroundColor(.white)
        }
      }
    }
      .padding()
  }
}

struct CityTextView_Previews: PreviewProvider {
    static var previews: some View {
      CityTextView()
        .preferredColorScheme(.dark)
    }
}
