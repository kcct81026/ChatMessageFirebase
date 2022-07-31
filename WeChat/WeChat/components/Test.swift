//
//  Test.swift
//  WeChat
//
//  Created by KC on 26/07/2022.
//

import SwiftUI
import CodeScanner
import Combine

struct Test: View {
    @StateObject var mockData = ContactViewModel()
    @State var isMomentScreenShowing: Bool = false
    
    var body: some View {
        NavigationView{
            ScrollView( showsIndicators: false){
                VStack(alignment: .leading, spacing: 10){
                
                    ActiveView(data: mockData.contactData)
                }
                
            }
            .navigationBarTitleDisplayMode(.inline)
            .navigationTitle("Chats")
            .navigationBarItems(trailing:  NavigationLink(destination: ChatMessageVIew(), label: {
                ZStack{
                    Rectangle()
                    .frame(width: 32, height: 32, alignment: .center)
                    .background(Color("custom-blue"))
                    .cornerRadius(5)

                    Image("post")
                        .resizable()
                    .frame(width: 16, height: 16)
                }
            }))

        }
    }
}

struct ActiveView : View{
    var data : [ContactData] = []

    
    var body: some View{
        
       
    
        VStack(alignment: .leading, spacing: 10){
            Text("Active Now")
                .font(.subheadline)
                .foregroundColor(Color("darkblue"))
                .padding(.leading,10)
            
            ScrollView(.horizontal, showsIndicators: false){
                HStack(alignment: .top, spacing: 10){
                    ForEach(data.self){ item in
                        ActiveItemView(data: item )
                    }
                }.padding(.leading, 10).padding(.trailing,10)
                
            }
            
            
            
           
        }
        //.frame(width: UIScreen.main.bounds.width - 20)
        .padding(.vertical)
        
        
    }
}
       

struct Test_Previews: PreviewProvider {
    static var previews: some View {
        Test()
    }
}




