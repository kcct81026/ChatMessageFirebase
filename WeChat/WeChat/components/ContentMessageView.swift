//
//  ContentMessageView.swift
//  WeChat
//
//  Created by KC on 29/07/2022.
//

import SwiftUI

struct ContentTextMessageView: View {
    var contentMessage: Message
    var isCurrentUser: Bool
   

    
    var body: some View {
        VStack(alignment: isCurrentUser ? .trailing : .leading, spacing: 10){

            Text(contentMessage.content)
                .font(.system(size: 16))

            HStack(spacing: 5){
                Text("12:30 Am")
                    .font(.system(size: 12))
                    .foregroundColor(isCurrentUser ? Color.white : Color.gray)
                
                if isCurrentUser{
                    Image("seen")
                        .resizable()
                        .frame(width: 24, height: 24)
                }
            }
            
            
        }
       .padding(10)
       .foregroundColor(isCurrentUser ? Color.white : Color.black)
       .background(isCurrentUser ? Color("darkblue") : Color(UIColor(red: 240/255, green: 240/255, blue: 240/255, alpha: 1.0)))
        .cornerRadius(10)
    }
}

