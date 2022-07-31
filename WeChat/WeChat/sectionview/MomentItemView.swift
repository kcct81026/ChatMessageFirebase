//
//  MomentItemView.swift
//  WeChat
//
//  Created by KC on 25/07/2022.
//

import SwiftUI

struct MomentItemView: View {
    
    var data : MomentData
    @ObservedObject var imageLoader = ImageLoader()
    @State var image: UIImage = UIImage()
    
    var body: some View {
        VStack(alignment: .leading){
            HStack{
                Image(uiImage: image)
                    .resizable()
                    .frame(width:40,height: 40)
                    .clipShape(Circle())
                    .onReceive(imageLoader.$image) { image in
                        self.image = image
                    }
                    .onAppear {
                        imageLoader.loadImage(for: "https://i.pinimg.com/originals/5c/50/ff/5c50ff689835415e2c7fd9f29156c817.jpg")
                    }
                VStack(alignment: .leading){
                    Text("\(data.name)")
                        .font(.system(size: 16))
                    Text("3 hr ago")
                        .font(.system(size: 14))
                        .foregroundColor(Color.gray)
                }
                Spacer()
                Image(systemName: "ellipsis")
            }
            
            if data.postUrl.count > 1{
                Image(uiImage: image)
                    .resizable()
                    .frame(height: 180)
                    .cornerRadius(10)
                    .onReceive(imageLoader.$image) { image in
                        self.image = image
                    }
                    .onAppear {
                        imageLoader.loadImage(for: "https://i.pinimg.com/originals/5c/50/ff/5c50ff689835415e2c7fd9f29156c817.jpg")
                    }
            }
            else {
                HStack(spacing : 10){
                                
                    Image(uiImage: image)
                        .resizable()
                        .frame(height: 250)
                        .cornerRadius(10)
                        .onReceive(imageLoader.$image) { image in
                            self.image = image
                        }
                        .onAppear {
                            imageLoader.loadImage(for: "https://i.pinimg.com/originals/5c/50/ff/5c50ff689835415e2c7fd9f29156c817.jpg")
                        }
                    Image(uiImage: image)
                        .resizable()
                        .frame(height: 250)
                        .cornerRadius(10)
                        .onReceive(imageLoader.$image) { image in
                            self.image = image
                        }
                        .onAppear {
                            imageLoader.loadImage(for: "https://i.pinimg.com/originals/5c/50/ff/5c50ff689835415e2c7fd9f29156c817.jpg")
                        }
                }
            }
            
            HStack(spacing: 10){
                Image("heart-fill")
                    .resizable()
                    .frame(width: 24, height: 24)
                Text("24")
                    .foregroundColor(Color.red)
                Spacer()
                Image("chat-post")
                    .resizable()
                    .frame(width: 24, height: 24)
                Text("24")
                    .foregroundColor(Color.red)
                Image("bookmark")
                    .resizable()
                    .frame(width: 24, height: 24)
            }
            
           
        }
    }
}

struct MomentItemView_Previews: PreviewProvider {
    static var previews: some View {
        MomentItemView(data: MomentData(name: "Smith", image: "", caption: "Caption", postUrl: []))
    }
}
