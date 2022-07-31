//
//  CheckboxView.swift
//  WeChat
//
//  Created by KC on 25/07/2022.
//

import SwiftUI

struct CheckboxView: View {
    @Binding var checked: Bool

       var body: some View {
           Image(systemName: checked ? "checkmark.square.fill" : "square")
               .foregroundColor(checked ? Color(UIColor.systemBlue) : Color.secondary)
               .onTapGesture {
                   self.checked.toggle()
               }
       }
}

struct CheckboxView_Previews: PreviewProvider {
    static var previews: some View {
        CheckboxView(checked: .constant(true))
    }
}
