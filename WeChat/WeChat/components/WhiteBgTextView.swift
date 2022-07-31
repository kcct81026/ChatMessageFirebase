//
//  WhiteBgTextView.swift
//  WeChat
//
//  Created by KC on 23/07/2022.
//

import SwiftUI

struct WhiteBgTextView: View {
    var text: String
    var width: Int
    var body: some View {
        Text(text)
            .font(.headline)
            .fontWeight(.semibold)
            .frame(width: CGFloat(width), height: 50, alignment: .center)
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(.gray))
        
      
    }
}

struct WhiteBgTextView_Previews: PreviewProvider {
    static var previews: some View {
        WhiteBgTextView(text: "", width: 0)
    }
}
