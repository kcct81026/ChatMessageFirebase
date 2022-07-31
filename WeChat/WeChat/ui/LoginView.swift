//
//  LoginView.swift
//  WeChat
//
//  Created by KC on 21/07/2022.
//

import SwiftUI

struct LoginView: View {
    
    @Binding var isPrensented : Bool
    @State var textFieldPhoneValue: String = ""
    @State var textFieldPasswordValue: String = ""


    
    var body: some View {
        NavigationView{
            ScrollView {
                VStack{
                    WelcomeView()
                    
                   
                    
                    Text("Enter your phone number")
                        .foregroundColor(Color.black)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.top, 5)
                
                    TextField("", text: $textFieldPhoneValue)
                        .font(.headline)
                               
                    Rectangle().frame(height: 1)
                        .foregroundColor(Color("darkblue"))
                    
                    Text("Enter your password")
                        .foregroundColor(Color.black)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.top, 5)
                    
                    TextField("", text: $textFieldPasswordValue)
                        .font(.headline)
                               
                    Rectangle().frame(height: 1)
                        .foregroundColor(Color("darkblue"))
                    
                    Text("Forgot password?")
                        .foregroundColor(Color.black)
                        .frame(maxWidth: .infinity, alignment: .trailing)
                        .padding(.top, 5)
                       
                    BlueBgTextView(text: "Log in", width: 150)
                        .padding(.top, 20)
                        .onTapGesture {
                            
                        }
                        
                    
                        
                }
            }
            .padding(.trailing , 20).padding(.leading, 20)
                
                .navigationBarItems(leading: Button(action : {
                               // self.mode.wrappedValue.dismiss()
                    self.isPrensented = false
                }){
                    Image(systemName: "arrow.left")
            })
           
        }
    }
    
   
}


struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView(isPrensented: .constant(true))
    }
}

struct WelcomeView: View {
    var body: some View {
        Text("Welcome!")
            .font(.system(size: 40, weight: .bold))
            .foregroundColor(Color("darkblue"))
            .frame(maxWidth: .infinity, alignment: .leading)
        
        Text("Login to continue")
            .font(.headline)
            .foregroundColor(Color.gray)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.leading, 5)
        
        Image("welcome")
            .resizable()
            .frame( height: 250, alignment: .center)
            .padding(.top, 10)
    }
}


