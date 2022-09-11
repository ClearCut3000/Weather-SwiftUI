//
//  StrokeText.swift
//  Weather-SwiftUI
//
//  Created by Николай Никитин on 11.09.2022.
//

import SwiftUI

struct StrokeText: View {

  let text: String
      let width: CGFloat
      let color: Color

    var body: some View {
      ZStack {
        ZStack {
          Text(text).offset(x: width, y: width)
          Text(text).offset(x: -width, y: -width)
          Text(text).offset(x: -width, y: width)
          Text(text).offset(x: width, y: -width)
        }
        .foregroundColor(color)
        Text(text)
      }
    }
}

struct StrokeText_Previews: PreviewProvider {
    static var previews: some View {
      StrokeText(text: "Some text sample", width: 1, color: .white)
    }
}
