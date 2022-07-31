//
//  MomentViewModel.swift
//  WeChat
//
//  Created by KC on 25/07/2022.
//

import Foundation

class MomentViewModel: ObservableObject{
    
    @Published var data: [MomentData] = []
    
    init(){
        getData()
    }
    
    func getData(){
        self.data.append(contentsOf: [
            MomentData(name: "David", image: "img", caption: "Hello", postUrl: [
                "img1",
                "img2"
            ]),
            MomentData(name: "Eddie", image: "img", caption: "This is first post", postUrl: [
                "img1",
            ]),
            
            MomentData(name: "Sophie", image: "img", caption: "Long time no see", postUrl: [
                "img1",
                "img2"
            ]),
            
            MomentData(name: "May", image: "img", caption: "", postUrl: [
                "img1",
                "img2"
            ])
        ])
    }
}



