//
//  MainWeatherStackView.swift
//  Weather-SwiftUI
//
//  Created by Николай Никитин on 08.09.2022.
//

import SwiftUI

struct MainWeatherStackView: View {
  var imageURL: URL
  var tempMin: Int
  var tempMax: Int
  var main: String
  var description: String

  var body: some View {
    VStack(spacing: 8) {
      AsyncImage(url: imageURL) { image in
        image
          .resizable()
          .scaledToFit()
          .scaleEffect(1.5)
          .frame(width: 180, height: 180)
      } placeholder: {
        Image(systemName: "cloud.sun.fill")
          .resizable()
          .scaledToFit()
          .frame(width: 180, height: 180)
      }
      VStack {
        Text(main)
        Text(description.capitalized)
      }
      .foregroundColor(.white)
      .font(.system(size: 14, weight: .light, design: .default))

      HStack(spacing: 50) {
        Text("\(tempMin)°")
          .foregroundColor(.blue)
        Text("\(tempMax)°")
          .foregroundColor(.red)
      }
        .font(.system(size: 60, weight: .medium, design: .default))
    }
  }
}

struct MainWeatherStackView_Previews: PreviewProvider {
    static var previews: some View {
      MainWeatherStackView(imageURL: URL(string: "https://openweathermap.org/img/wn/10d@2x.png")!, tempMin: 10, tempMax: 20, main: "cloud", description: "Some description")
        .preferredColorScheme(.dark)
    }
}
