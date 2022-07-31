//
//  AddNewGroupScreen.swift
//  WeChat
//
//  Created by KC on 29/07/2022.
//

import SwiftUI

struct AddNewGroupScreen: View {
    @StateObject var mockData = ContactViewModel()
    @State var searchTerm = ""
    @State var textFieldGNValue: String = ""
    @Binding var isPrensented : Bool


    var body: some View {
        NavigationView{
            
            ScrollView(showsIndicators: false){
                VStack(alignment: .leading, spacing: 10){
                    
                    Text("Group Name")
                        .font(.subheadline)
                        .foregroundColor(Color("darkblue"))
                        .padding(.top, 20)
                        .padding(.leading, 20)
                    
                    TextField("", text: $textFieldGNValue)
                        .font(.headline)
                        .padding(.leading, 20)
                               
                    Rectangle().frame(height: 1)
                        .foregroundColor(Color("darkblue"))
                        .padding(.leading, 20)
                        .padding(.trailing, 20)
                    
                    HStack{
                        SearchView(searchTerm: $searchTerm)
                    }.padding()

                    AddedGroupView(data: mockData, searchTerm: searchTerm)

                    FavoriteGroupView(data: mockData, searchTerm: searchTerm)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(.gray).opacity(0.3))
                        .padding(.leading, 10)
                        .padding(.trailing, 10)

                    GroupSectionItemView(data: mockData, searchTerm: searchTerm)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(.gray).opacity(0.3))
                        .padding(.leading, 10)
                        .padding(.trailing, 10)



                }

            }
            .navigationBarTitleDisplayMode(.inline)
            .navigationTitle("New Moment")
            .navigationBarItems(leading: Button(action : {
                self.isPrensented = false
            }){
                Image("dismiss")
                    .resizable()
                    .frame(width:24, height: 24)
            })
            
            .navigationBarItems(trailing: Button(action : {
                           // self.mode.wrappedValue.dismiss()
                self.isPrensented = false
            }){
                BlueBgTextView(text: "Create", width: 80)
            })

            
        }.padding()

    }
}



struct FavoriteGroupView : View{
    @ObservedObject var data = ContactViewModel.init()
    var searchTerm = ""
    
    var body: some View{
    
        VStack(alignment: .leading, spacing: 10){
            Text("Favorites(\(data.favDictionary.count))")
                .font(.subheadline)
                .foregroundColor(Color("darkblue"))
                .fontWeight(.black)
                .padding(.leading,10)
            
            ForEach(data.favDictionary.keys.sorted(), id:\.self) { key in
                if let favs = data.favDictionary[key]!.filter({ (contact) -> Bool in
                    self.searchTerm.isEmpty ? true :
                    "\(contact)".lowercased().contains(self.searchTerm.lowercased())}), !favs.isEmpty
                {
                    ForEach(favs.self){ item in
                        CheckContactItemView(data: item )
                    }
                    .padding(.leading, 10)
                }
            }
            
            
           
        }
        //.frame(width: UIScreen.main.bounds.width - 20)
        .padding(.vertical)
        
        
    }
}

struct GroupSectionItemView: View{
    @ObservedObject var data = ContactViewModel.init()
    var searchTerm = ""
    
    
    var body: some View{
        
        ForEach(data.sectionDictionary.keys.sorted(), id:\.self) { key in
            if let contacts = data.sectionDictionary[key]!.filter({ (contact) -> Bool in
                self.searchTerm.isEmpty ? true :
                "\(contact)".lowercased().contains(self.searchTerm.lowercased())}), !contacts.isEmpty
            {
                VStack(alignment: .leading, spacing: 10){
                    Text("\(key)")
                        .font(.subheadline)
                        .foregroundColor(Color("darkblue"))
                        .fontWeight(.black)
                        .padding(.leading,10)
                    
                    ForEach(contacts){ item in
                        CheckContactItemView(data: item )
                    }.padding(.leading, 10)
                }
                //.frame(width: UIScreen.main.bounds.width - 20)
                .padding(.vertical)
            }
            
        }
        

      
    }
}

struct AddedGroupView : View{
    
    @ObservedObject var data = ContactViewModel.init()
    var searchTerm = ""
    
    var body: some View{
        VStack(alignment: .leading, spacing: 10){
            Text("Group(5)")
                .font(.subheadline)
                .foregroundColor(Color("darkblue"))
                .fontWeight(.black)
                .padding(.leading,10)
            
            ScrollView(.horizontal, showsIndicators: false){
                HStack(spacing: 10){
                    
                    ForEach(data.favDictionary.keys.sorted(), id:\.self) { key in
                        if let groups = data.favDictionary[key]!.filter({ (contact) -> Bool in
                            self.searchTerm.isEmpty ? true :
                            "\(contact)".lowercased().contains(self.searchTerm.lowercased())}), !groups.isEmpty
                        {
                            ForEach(groups.self){ groupItem in
                                ShowChoseContactItemView(data: groupItem)
                            }
                        }
                    }
                    
                   
                                
                }.padding(.leading,10)
            }
            
        }
    }
}

//struct AddNewGroupScreen_Previews: PreviewProvider {
//    static var previews: some View {
//        AddNewGroupScreen()
//    }
//}
