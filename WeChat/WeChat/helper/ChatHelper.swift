//
//  ChatHelper.swift
//  WeChat
//
//  Created by KC on 29/07/2022.
//

import Foundation
import Combine

class ChatHelper : ObservableObject {
 
    var didChange = PassthroughSubject<Void, Never>()
    @Published var realTimeMessages = Dummy.messages
    
    func sendMessage(_ chatMessage: Message) {
        realTimeMessages.append(chatMessage)
        didChange.send(())
    }
}
