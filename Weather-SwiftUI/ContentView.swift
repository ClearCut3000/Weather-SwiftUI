//
//  ContentView.swift
//  Weather-SwiftUI
//
//  Created by Николай Никитин on 19.08.2022.
//

import SwiftUI

struct ContentView: View {

  //MARK: - Main View
  var body: some View {
    ZStack {
      LinearGradient(gradient: Gradient(colors: [.blue, Color("lightBlue")]),
                     startPoint: .topLeading,
                     endPoint: .bottomTrailing)
        .edgesIgnoringSafeArea(.all)
      VStack {
        Text("Cupertino, CA")
          .font(.system(size: 32, weight: .medium, design: .default))
          .foregroundColor(.white)
          .padding()
        VStack(spacing: 8) {
          Image(systemName: "cloud.sun.fill")
            .renderingMode(.original)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 180, height: 180)
          Text("76°")
            .font(.system(size: 70, weight: .medium, design: .default))
            .foregroundColor(.white)
        }
        .padding(.bottom, 40)

        HStack(spacing: 20) {
          WeatherDayView(dayOfWeek: "TUE",
                         imageName: "cloud.sun.fill",
                         temperature: 74)

          WeatherDayView(dayOfWeek: "WED",
                         imageName: "cloud.rain.fill",
                         temperature: 65)

          WeatherDayView(dayOfWeek: "THU",
                         imageName: "cloud.fill",
                         temperature: 70)

          WeatherDayView(dayOfWeek: "FRI",
                         imageName: "sun.max.fill",
                         temperature: 72)

          WeatherDayView(dayOfWeek: "SAT",
                         imageName: "wind",
                         temperature: 69)
        }
        Spacer()
      }
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}

struct WeatherDayView: View {
  var dayOfWeek: String
  var imageName: String
  var temperature: Int

  var body: some View {
    VStack {
      Text(dayOfWeek)
        .font(.system(size: 16, weight: .medium, design: .default))
        .foregroundColor(.white)
      Image(systemName: imageName)
        .renderingMode(.original)
        .resizable()
        .aspectRatio(contentMode: .fit)
        .frame(width: 40, height: 40)
      Text("\(temperature)°")
        .font(.system(size: 28, weight: .medium, design: .default))
        .foregroundColor(.white)
    }
  }
}
