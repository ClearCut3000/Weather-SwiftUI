//
//  WeatherDayView.swift
//  Weather-SwiftUI
//
//  Created by Николай Никитин on 09.09.2022.
//

import SwiftUI

struct WeatherDayView: View {

  var calDate = "10/10/2022"
  var visibility = 10000
  var pressure = 220
  var humidity = 40
  var windSpeed = 1.2
  var windDirection = "ENE"
  var cloudiness = 80

  var body: some View {
    VStack(spacing: 10) {
      Text("Time of data calculation " + calDate)
        .fontWeight(.light)
      HStack {
        VStack {
          Image(systemName: "eye.fill")
            .resizable()
            .scaledToFit()
            .frame(width: 20, height: 20)
          Text("\(visibility) m")
            .fontWeight(.light)
            .scaledToFill()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .font(.body)
        .padding(8)
        .overlay(RoundedRectangle(cornerRadius: 16)
                  .stroke(.blue, lineWidth: 2)
        )
        VStack {
          Image(systemName: "speedometer")
            .resizable()
            .scaledToFit()
            .frame(width: 20, height: 20)
          Text("\(pressure) hPa")
            .fontWeight(.light)
            .scaledToFill()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .font(.body)
        .padding(8)
        .overlay(RoundedRectangle(cornerRadius: 16)
                  .stroke(.blue, lineWidth: 2)
        )
        VStack {
          Image(systemName: "drop.circle")
            .resizable()
            .scaledToFit()
            .frame(width: 20, height: 20)
          Text("\(humidity) %")
            .fontWeight(.light)
            .scaledToFill()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .font(.body)
        .padding(8)
        .overlay(RoundedRectangle(cornerRadius: 16)
                  .stroke(.blue, lineWidth: 2)
        )
      }
      .frame(maxHeight: 200)
      .fixedSize(horizontal: true, vertical: true)
      HStack {
        VStack {
          Image(systemName: "wind")
            .resizable()
            .scaledToFit()
            .frame(width: 20, height: 20)
          Text("\(windSpeed) m/s")
            .fontWeight(.light)
            .scaledToFill()
          Text (windDirection)
            .fontWeight(.light)
            .scaledToFill()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .font(.body)
        .padding(8)
        .overlay(RoundedRectangle(cornerRadius: 16)
                  .stroke(.blue, lineWidth: 2)
        )
        VStack {
          Image(systemName: "cloud.fill")
            .resizable()
            .scaledToFit()
            .frame(width: 20, height: 20)
          Text("\(cloudiness) %")
            .fontWeight(.light)
            .scaledToFill()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .font(.body)
        .padding(8)
        .overlay(RoundedRectangle(cornerRadius: 16)
                  .stroke(.blue, lineWidth: 2)
        )
      }
      .frame(maxHeight: 200)
      .fixedSize(horizontal: true, vertical: true)
    }
    .foregroundColor(.white)
  }
}

struct WeatherDayView_Previews: PreviewProvider {
  static var previews: some View {
    WeatherDayView()
      .preferredColorScheme(.dark)
  }
}
