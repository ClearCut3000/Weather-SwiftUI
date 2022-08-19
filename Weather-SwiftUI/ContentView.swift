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
      LinearGradient(gradient: Gradient(colors: [.blue, .white]),
                     startPoint: .topLeading,
                     endPoint: .bottomTrailing)
        .edgesIgnoringSafeArea(.all)
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
