//
//  ChooseContactItemView.swift
//  WeChat
//
//  Created by KC on 28/07/2022.
//

import SwiftUI

struct CheckContactItemView: View {
    var data : ContactData
    @ObservedObject var imageLoader = ImageLoader()
    @State var image: UIImage = UIImage()
    @State var isMarked : Bool = false
    
    var body: some View {
        HStack(alignment: .top){
            ZStack(alignment: .bottomTrailing){
                Image(uiImage: image)
                    .resizable()
                    .scaledToFill()
                    .frame(width:60,height: 60)
                    .clipShape(Circle())
                    .onReceive(imageLoader.$image) { image in
                        self.image = image
                    }
                    .onAppear {
                        imageLoader.loadImage(for: "https://i.pinimg.com/originals/5c/50/ff/5c50ff689835415e2c7fd9f29156c817.jpg")
                    }
                
                Circle()
                    .strokeBorder(Color.white,lineWidth: 3)
                    .background(Circle().foregroundColor(Color.green))
                    .frame(width: 16, height: 16)
                    .padding(.bottom, 6)
                    
                    
            }.frame(width: 60, height: 60)
            
            Text("\(data.name)")
                .font(.system(size: 16))
                .padding()
            
            Spacer()
            
            Image(self.isMarked ? "check-fill" : "check")
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 20, height: 20)
                .padding()
                .onTapGesture{
                    self.isMarked.toggle()
                }
            
        }
    }
}

