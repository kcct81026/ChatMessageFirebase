//
//  MomentScreen.swift
//  WeChat
//
//  Created by KC on 25/07/2022.
//

import SwiftUI

struct MomentScreen: View {
    
    @StateObject var mockData = MomentViewModel()
    @State var isMomentScreenShowing: Bool = false
    
    var body: some View {
        NavigationView{
            ScrollView( showsIndicators: false){
                ForEach(mockData.data.self){ moment in
                    VStack{
                        MomentItemView(data: moment)
                            .padding(.horizontal, 15)
                            .padding(.vertical, 15)
                        Divider()
                    }
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .navigationTitle("Moments")
            
            .navigationBarItems(trailing: Button(action : {
                self.isMomentScreenShowing = true
            }){
                ZStack{
                    Rectangle()
                    .frame(width: 32, height: 32, alignment: .center)
                    .background(Color("custom-blue"))
                    .cornerRadius(5)

                Image("post")
                    .resizable()
                .frame(width: 16, height: 16)
                }
            }).sheet(isPresented: $isMomentScreenShowing){
                NewMomentScreen(isPrensented: $isMomentScreenShowing)
            }

        }
    }
}

struct MomentScreen_Previews: PreviewProvider {
    static var previews: some View {
        MomentScreen()
    }
}
