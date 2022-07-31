//
//  ImageView.swift
//  WeChat
//
//  Created by KC on 26/07/2022.
//

import SwiftUI

struct ImageView: View {
  var uiImage: UIImage
  
  var body: some View {
    Image(uiImage: uiImage)
      .resizable()
      .frame(width: 100, height: 100)
      .aspectRatio(contentMode: .fit)
      .cornerRadius(10)
  }
}
