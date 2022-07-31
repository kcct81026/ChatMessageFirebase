//
//  OtpView.swift
//  WeChat
//
//  Created by KC on 24/07/2022.
//

import SwiftUI

struct OtpView: View {
    
    @Binding var isPrensented : Bool
    @State var textFieldOtpValue :  String = ""
    @State var isOtpShowing: Bool = false

    
    var body: some View {
        NavigationView{
            ScrollView {
                VStack{
                    TopView()
                    
                    HStack{
                        VStack{
                            
                            TextField("Enter your phone number", text: $textFieldOtpValue)
                                .font(.headline)
                            
                            Rectangle().frame(height: 1)
                                .foregroundColor(Color("darkblue"))
                        }
                        
                        BlueBgTextView(text: "Get OTP", width: 100)
                            .padding(.leading, 10)
                        
                    }.padding(.top, 5)
                    
                    Spacer(minLength: 100)
                    
                    BlueBgTextView(text: "Verify", width: 150)
                        .padding(.leading, 10)
                        .onTapGesture {                        
                            self.isOtpShowing = true
                        }.sheet(isPresented: $isOtpShowing, content: {
                            FillUserInfoView(isPrensented: self.$isOtpShowing)
                    })


                    
                
                    Spacer()
                    
                    
                }
            }
            .padding(.trailing , 20).padding(.leading, 20)
                
                .navigationBarItems(leading: Button(action : {
                    self.isPrensented = false
                }){
                    Image(systemName: "arrow.left")
            })
           
        }
    }
}

struct OtpView_Previews: PreviewProvider {
    static var previews: some View {
        OtpView(isPrensented: .constant(true))
    }
}


struct TopView: View {
    var body: some View {
        Text("Hi!")
            .font(.system(size: 40, weight: .bold))
            .foregroundColor(Color("darkblue"))
            .frame(maxWidth: .infinity, alignment: .leading)
        
        Text("Create a new account")
            .font(.headline)
            .foregroundColor(Color.gray)
            .frame(maxWidth: .infinity, alignment: .leading)
        
        Image("otp")
            .resizable()
            .frame( height: 250, alignment: .center)
            .padding(.top, 10)
    }
}

