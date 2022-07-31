//
//  NewMomentScreen.swift
//  WeChat
//
//  Created by KC on 25/07/2022.
//

import SwiftUI
import Foundation

struct NewMomentScreen: View {
    @ObservedObject var imageLoader = ImageLoader()
    @State var image: UIImage = UIImage()
    @State var textFieldPostValue: String = ""
    @State private var showingImagePicker = false
    @State private var photoPickerIsPresented = false
    @State var pickerResult: [UIImage] = []
    
    @Binding var isPrensented : Bool

    
    var body: some View {
        NavigationView{
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
                    
                    Text("Ame")
                        .font(.system(size: 24))
                        .foregroundColor(Color("darkblue"))
                }.padding(.vertical)
                ScrollView(showsIndicators: false ){
                    TextField("What's is on your mind", text: $textFieldPostValue)
                        .font(.headline)
                        .padding()
                    
                }
                
               
                
                Spacer()
                
                ScrollView(.horizontal, showsIndicators: false){
                    HStack{
                        ForEach(pickerResult, id: \.self) { uiImage in
                            ImageView(uiImage: uiImage)
                        }
                        
                        
                        ZStack{
                            Rectangle().frame(width: 100, height: 100)
                                .foregroundColor(Color.white)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(Color("darkblue"))
                                    )
                            
                            Image("plus")
                                .resizable()
                                .frame(width:40,height: 40)
                                .onTapGesture {
                                    //showingImagePicker = true
                                    photoPickerIsPresented = true
                                }.sheet(isPresented: $photoPickerIsPresented){
                                    PhotoPicker(pickerResult: $pickerResult, isPresented: $photoPickerIsPresented)
                                }

                        }
                    }
                }
                

              
                
            }
            .navigationBarTitleDisplayMode(.inline)
            .navigationTitle("New Moment")
            .navigationBarItems(leading: Button(action : {
                self.isPrensented = false
            }){
                Image("dismiss")
                    .resizable()
                    .frame(width:24, height: 24)
            })
            
            .navigationBarItems(trailing: Button(action : {
                           // self.mode.wrappedValue.dismiss()
                //self.isPrensented = false
            }){
                BlueBgTextView(text: "Create", width: 80)
            })
       
        }.padding()
    }
    
   
}

struct NewMomentScreen_Previews: PreviewProvider {
    static var previews: some View {
        NewMomentScreen(isPrensented: .constant(false))
    }
}


