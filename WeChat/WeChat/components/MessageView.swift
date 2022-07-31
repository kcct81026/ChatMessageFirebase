//
//  MessageView.swift
//  WeChat
//
//  Created by KC on 29/07/2022.
//

import SwiftUI

struct MessageView: View {
    var currentMessage: Message
       var body: some View {
           HStack(alignment: .top, spacing: 15) {
               if !currentMessage.user.isCurrentUser {
                   Image(currentMessage.user.avatar)
                   .resizable()
                   .frame(width: 40, height: 40, alignment: .center)
                   .cornerRadius(20)
               } else {
                   Spacer()
               }
               
               switch(currentMessage.type){
               case .audio:
                   Text("contentMessage")
                       .font(.system(size: 16))
               case .gif:
                   ContentGifView()
               case .image:
                   ContentImageView(contentMessage: currentMessage, isCurrentUser: currentMessage.user.isCurrentUser)
                        
               case .text:
                   ContentTextMessageView(contentMessage: currentMessage,
                                      isCurrentUser: currentMessage.user.isCurrentUser)
               case  .video:
                   Text("contentMessage")
                       .font(.system(size: 16))
               }

               
           }
       }
}

struct MessageView_Previews: PreviewProvider {
    static var previews: some View {
        MessageView(currentMessage: Message(content: "Hello", user: Dummy.secondUser, type: .text))
    }
}


