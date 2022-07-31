//
//  ContentTextImageView.swift
//  WeChat
//
//  Created by KC on 29/07/2022.
//

import SwiftUI

struct ContentImageView: View {
    var contentMessage: Message
    var isCurrentUser: Bool
    @ObservedObject var imageLoader = ImageLoader()
    @State var image: UIImage = UIImage()
    
    var body: some View {
        VStack(alignment: .trailing, spacing: 10){

            Image(uiImage: image)
                .resizable()
                .frame(width:250,height: 180)
                .cornerRadius(10)
                .onReceive(imageLoader.$image) { image in
                    self.image = image
                }
                .onAppear {
                    imageLoader.loadImage(for: "https://i.pinimg.com/originals/5c/50/ff/5c50ff689835415e2c7fd9f29156c817.jpg")
            }
            HStack(spacing: 5){
                Text("12:30 Am")
                    .font(.system(size: 12))
                    .foregroundColor(Color.gray)
                
                if isCurrentUser{
                    Image("seen")
                        .resizable()
                        .frame(width: 24, height: 24)
                }
            }
            
            
        }
       .foregroundColor(isCurrentUser ? Color.white : Color.black)
//       .background(isCurrentUser ? Color("darkblue") : Color(UIColor(red: 240/255, green: 240/255, blue: 240/255, alpha: 1.0)))
//        .cornerRadius(10)
    }
}

