//
//  ChatMessageVIew.swift
//  WeChat
//
//  Created by KC on 30/07/2022.
//

import SwiftUI
import Combine

struct ChatMessageVIew: View {
    @State var typingMessage: String = ""
    @StateObject var chatHelper = ChatHelper()
    @ObservedObject private var keyboard = KeyboardResponder()

       var body: some View {
           NavigationView {
               VStack {
                   List {
                       ForEach(chatHelper.realTimeMessages, id: \.self) { msg in
                           MessageView(currentMessage: msg)
                               .listRowSeparator(.hidden)
                       }
                   }
                   .listStyle(.plain)
                   
                   .foregroundColor(Color.clear)
                   HStack {
                       TextField("Message...", text: $typingMessage)
                           .textFieldStyle(RoundedBorderTextFieldStyle())
                           .frame(minHeight: CGFloat(30))
                       Button(action: sendMessage) {
                           Text("Send")
                       }
                   }.frame(minHeight: CGFloat(50)).padding()
               }.navigationBarTitle(Text(Dummy.firstUser.name), displayMode: .inline)
               .padding(.bottom, keyboard.currentHeight)
               .edgesIgnoringSafeArea(keyboard.currentHeight == 0.0 ? .leading: .bottom)
           }.onTapGesture {
                   self.endEditing(true)
           }
       }
       
       func sendMessage() {
           chatHelper.sendMessage(Message(content: typingMessage, user: Dummy.secondUser, type: .text))
           typingMessage = ""
       }
}

struct ChatMessageVIew_Previews: PreviewProvider {
    static var previews: some View {
        ChatMessageVIew()
    }
}
