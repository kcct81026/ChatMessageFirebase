//
//  SplashScreenView.swift
//  WeChat
//
//  Created by KC on 20/07/2022.
//

import SwiftUI

struct SplashScreenView: View {
    
    @State var isSignUpShowing: Bool = false
    @State var isSplashShowing: Bool = false
    
    

    
    var body: some View {
        VStack{
            Spacer()
            Image("logo")
                .resizable()
                .frame(width: 150, height: 150, alignment: .center)
                
            Spacer()
            Text("Text your friends and share moments")
                .padding()
                .font(.headline.weight(.heavy))
                .foregroundColor(Color("darkblue"))
                
            
            Text("End-to-end secured messaging app with Social Elements")
                .font(.subheadline)
                .foregroundColor(Color("darkblue"))
        
            
            
            HStack{
                WhiteBgTextView(text: "Sign Up", width: 150)
                    .padding(.trailing, 10)
                    .onTapGesture {
                        self.isSignUpShowing = true
                    }.sheet(isPresented: $isSignUpShowing, content: {
                        OtpView(isPrensented: self.$isSignUpShowing)
                })

                
                BlueBgTextView(text: "Log in", width: 150)
                    .onTapGesture {
                        self.isSplashShowing = true
                    }.sheet(isPresented: $isSplashShowing, content: {
                        LoginView(isPrensented: self.$isSplashShowing)
                })

                    
            }
            .padding(.top, 50)
            Spacer()
        }
    }
}

struct SplashScreenView_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreenView()
    }
}
