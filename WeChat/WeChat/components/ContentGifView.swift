//
//  ContentGifView.swift
//  WeChat
//
//  Created by KC on 29/07/2022.
//

import SwiftUI

struct ContentGifView: View {
    @State private var imageData: Data? = nil
    //var isCurrentUser: Bool

    var body: some View {
        VStack {
//            GIFImage(name: "preview")
//                .frame(height: 200)
            if let data = imageData {
                GIFImage(data: data)
                    .frame(width: 200,height: 200)
            } else {
                Text("Loading...")
                    .onAppear(perform: loadData)
                }
        }.cornerRadius(10)
      }

    private func loadData() {
        let task = URLSession.shared.dataTask(with: URL(string: "https://i.pinimg.com/originals/5f/05/2b/5f052b5b7375c79ad256aa65c55fece0.gif")!) { data, response, error in
            imageData = data
        }
            task.resume()
    }
}

struct ContentGifView_Previews: PreviewProvider {
    static var previews: some View {
        ContentGifView()
    }
}
