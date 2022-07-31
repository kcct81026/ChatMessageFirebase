//
//  PickerTextView.swift
//  WeChat
//
//  Created by KC on 24/07/2022.
//

import SwiftUI

struct PickerTextView: View {
    
    var text: String
    
    var body: some View {
        HStack{
                        
            Text(text).foregroundColor(Color.black)
                
            Spacer()
    
            
            Image("down-arrow")
                .resizable()
                .frame(width: 15, height: 15, alignment: .center)
            
            
        }
        .padding()
        .frame(width: UIScreen.main.bounds.width/3.5, alignment: .center)
        .background(
            Rectangle()
                .fill(Color.white)
                .shadow(
                    color: Color.gray.opacity(0.5),
                    radius: 8,
                    x: 8,
                    y: 8
            )
        )
    }
}

struct PickerTextView_Previews: PreviewProvider {
    static var previews: some View {
        PickerTextView(text: "Hello")
    }
}
