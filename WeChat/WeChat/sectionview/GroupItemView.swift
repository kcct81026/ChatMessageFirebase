//
//  GroupItemView.swift
//  WeChat
//
//  Created by KC on 26/07/2022.
//

import SwiftUI

struct GroupItemView: View {
    var data : GroupData
    @State var image: UIImage = UIImage()
    @ObservedObject var imageLoader = ImageLoader()
    
    
    var body: some View {
        ZStack{
            Rectangle().frame(width: 100, height: 100)
                .foregroundColor(Color.white)
                .background(Color("darkblue").opacity(0.3))
                .cornerRadius(10)
            
            VStack(alignment: .center, spacing: 5){
                Image(uiImage: image)
                    .resizable()
                    .frame(width:50,height: 50)
                    .cornerRadius(5)
                    .onReceive(imageLoader.$image) { image in
                        self.image = image
                    }
                    .onAppear {
                        imageLoader.loadImage(for: "https://i.pinimg.com/originals/5c/50/ff/5c50ff689835415e2c7fd9f29156c817.jpg")
                    }
                
                Text("\(data.name)")
                    .foregroundColor(Color.black)
            }
        }
        .shadow(color: .gray, radius: 4, x: 0, y: 5)
        .padding(.all, 5)
    }
}

