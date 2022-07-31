//
//  PlayerManager.swift
//  WeChat
//
//  Created by KC on 30/07/2022.
//

import Foundation
import Combine
import AVKit
import SwiftUI



class PlayerManager : ObservableObject {
    let player = AVPlayer(url: URL(string: "https://media.w3.org/2010/05/sintel/trailer.mp4")!)
    @Published private var playing = false
    
    func getState() -> Bool{
        return playing
    }
    
    func pause() {
        player.play()
        playing = true
    }
    
    func play() {
        player.play()
        playing = true
    }
    
    func playPause() {
        if playing {
            player.pause()
        } else {
            player.play()
        }
        playing.toggle()
    }
}

struct AVPlayerControllerRepresented : UIViewControllerRepresentable {
    var player : AVPlayer
    
    func makeUIViewController(context: Context) -> AVPlayerViewController {
        let controller = AVPlayerViewController()
        controller.player = player
        controller.showsPlaybackControls = false
        return controller
    }
    
    func updateUIViewController(_ uiViewController: AVPlayerViewController, context: Context) {
        
    }
}

