//
//  ButtonView.swift
//  WeChat
//
//  Created by KC on 23/07/2022.
//

import SwiftUI

struct BlueBgTextView: View {
    
    var text : String
    var width: Int
    var body: some View {
        Text(text)
            .font(.headline)
            .fontWeight(.semibold)
            .frame(width: CGFloat(width), height: 50, alignment: .center)
            .background(Color("darkblue"))
            .foregroundColor(Color.white)
            .cornerRadius(10)
           
    }
}

struct ButtonView_Previews: PreviewProvider {
    static var previews: some View {
        BlueBgTextView(text: "", width: 0)
    }
}
