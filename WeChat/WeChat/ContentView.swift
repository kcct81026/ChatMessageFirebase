//
//  ContentView.swift
//  WeChat
//
//  Created by KC on 20/07/2022.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedTab = TapItem.moment

    var body: some View {
        TabView{
            MomentScreen()
                .tabItem{
                    Label{
                        Text("Moment")
                    } icon: {
                        Image("moment")
                            .renderingMode(.template)
                            .resizable()
                            .frame(width: 24, height: 24)
                            
                    }
                }.tag(TapItem.moment)
            
            ChatMessageVIew()
                .tabItem{
                    Label{
                        Text("Chat")
                    } icon: {
                        Image("chat")
                            .renderingMode(.template)

                    }
                }.tag(TapItem.chat)
            
            ContactScreen()
                .tabItem{
                    Label{
                        Text("Contacts")
                    } icon: {
                        Image("contact")
                            .renderingMode(.template)
                    }
                }.tag(TapItem.contacts)
            
            SplashScreenView()
                .tabItem{
                    Label{
                        Text("Me")
                    } icon: {
                        Image("me")
                            .renderingMode(.template)
                    }
                }.tag(TapItem.me)
            
            SplashScreenView()
                .tabItem{
                    Label{
                        Text("Setting")
                    } icon: {
                        Image("setting")
                            .renderingMode(.template)
                    }
                }.tag(TapItem.setting)
        }.accentColor(.primary)
    }
}

struct ContentView_Previews: PreviewProvider {
        
    static var previews: some View {
        ContentView()
    }
}

enum TapItem{
    case moment
    case chat
    case contacts
    case me
    case setting
}
