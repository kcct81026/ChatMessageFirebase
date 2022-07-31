//
//  MomentData.swift
//  WeChat
//
//  Created by KC on 26/07/2022.
//

import Foundation

struct MomentData: Identifiable{
    let id = UUID().uuidString
    let name: String
    let image: String
    let caption: String
    let postUrl : [String]
}

struct GroupData : Identifiable{
    let id = UUID().uuidString
    let name: String
}

struct ContactData: Identifiable{
    let id = UUID().uuidString
    let name : String
}

struct Message : Hashable{
    var content: String
    var user: User
    var type: messageType
}
struct User : Hashable {
    var name: String
    var avatar: String
    var isCurrentUser: Bool = false
}

enum messageType {
    case text
    case image
    case video
    case audio
    case gif
}


struct Dummy : Hashable {
    static let firstUser = User(name: "Ame", avatar: "ame")
    static var secondUser = User(name: "Me", avatar: "ame", isCurrentUser: true)
    static let messages = [
        Message(content: "Hi, how are you?", user: Dummy.firstUser, type: .text),
        Message(content: "long time no see!", user: Dummy.secondUser, type: .text),
        Message(content: "😇", user: Dummy.firstUser, type: .text),
        Message(content: "Oh actually, I just sent you a photo.", user: Dummy.secondUser, type: .text),
        Message(content: "", user: Dummy.secondUser, type: .image),

        Message(content: "Oh cute ", user: Dummy.firstUser, type: .text),
        Message(content: "And. Here is my puppy", user: Dummy.firstUser, type: .text),
        Message(content: "Thanks", user: Dummy.firstUser, type: .gif),
        Message(content: "Cutie", user: Dummy.secondUser, type: .text)
    ]

}
