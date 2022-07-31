//
//  TestPlayerView.swift
//  WeChat
//
//  Created by KC on 30/07/2022.
//

import SwiftUI



struct TestPlayerView: View {
    @StateObject var playerManager = PlayerManager()
        
        var body: some View {
            VStack{
                VStack {
                    AVPlayerControllerRepresented(player: playerManager.player)
                        .onAppear {
                            playerManager.play()
                        }
                    Text("Play/Pause").onTapGesture{
                        
                        playerManager.playPause()
                    }
                }.frame(width: 200, height: 200, alignment: .center)
                
                VStack {
                    AVPlayerControllerRepresented(player: playerManager.player)
                        .onAppear {
                            playerManager.play()
                        }
                    Text("Play/Pause").onTapGesture{
                        playerManager.playPause()
                    }
                }.frame(width: 200, height: 200, alignment: .center)
            }
        }
}

struct TestPlayerView_Previews: PreviewProvider {
    static var previews: some View {
        TestPlayerView()
    }
}
