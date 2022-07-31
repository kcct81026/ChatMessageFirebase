//
//  RadioButtonGroups.swift
//  WeChat
//
//  Created by KC on 25/07/2022.
//

import SwiftUI

struct RadioButtonGroups: View {
    let callback: (String) -> ()
    @State var selectedId: String = ""
        
    var body: some View {
        HStack {
            radioMaleMajority
            radioFemaleMajority
            radioOtherMajority
        }
    }
        
    var radioMaleMajority: some View {
        RadioButtonField(
            id: Gender.male.rawValue,
            label: Gender.male.rawValue,
            isMarked: selectedId == Gender.male.rawValue ? true : false,
            callback: radioGroupCallback
        )
    }
        
    var radioFemaleMajority: some View {
        RadioButtonField(
            id: Gender.female.rawValue,
            label: Gender.female.rawValue,
            isMarked: selectedId == Gender.female.rawValue ? true : false,
            callback: radioGroupCallback
        )
    }
        
    var radioOtherMajority: some View {
        RadioButtonField(
            id: Gender.other.rawValue,
            label: Gender.other.rawValue,
            isMarked: selectedId == Gender.other.rawValue ? true : false,
            callback: radioGroupCallback
        )
    }
        
    func radioGroupCallback(id: String) {
        selectedId = id
        callback(id)
    }
}
    
struct RadioButtonField: View {
    let id: String
    let label: String
    let isMarked:Bool
    let callback: (String)->()
        
    init(
        id: String,
        label:String,
        isMarked: Bool = false,
        callback: @escaping (String)->()
    ) {
        self.id = id
        self.label = label
        self.isMarked = isMarked
        self.callback = callback
    }
        
        var body: some View {
            Button(action:{
                self.callback(self.id)
            }) {
                HStack(alignment: .top){
                Image(systemName: self.isMarked ? "largecircle.fill.circle" : "circle")
                    .renderingMode(.original)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 20, height: 20)
                Text(label)
                    .font(.subheadline)
                    .foregroundColor(Color.black)
                }
            }.padding(.vertical)
        }
}


enum Gender: String{
    case male = "Male"
    case female = "Female"
    case other = "Other"
}

