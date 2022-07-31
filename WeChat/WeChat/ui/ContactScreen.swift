//
//  ContactScreen.swift
//  WeChat
//
//  Created by KC on 26/07/2022.
//

import SwiftUI

struct ContactScreen: View {
    @State var isContactScreenShowing: Bool = false
    @StateObject var mockData = ContactViewModel()
    @State var searchTerm = ""

    var body: some View {
        NavigationView{
            
            ScrollView(showsIndicators: false){
                VStack(alignment: .leading, spacing: 10){
                    HStack{
                        SearchView(searchTerm: $searchTerm)
                    }.padding()

                    GroupView(data: mockData, searchTerm: searchTerm,  isContactScreenShowing: $isContactScreenShowing)

                    FavoriteView(data: mockData, searchTerm: searchTerm)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(.gray).opacity(0.3))
                        .padding(.leading, 10)
                        .padding(.trailing, 10)

                    SectionContactView(data: mockData, searchTerm: "")
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(.gray).opacity(0.3))
                        .padding(.leading, 10)
                        .padding(.trailing, 10)



                }

            }


            .navigationBarTitleDisplayMode(.inline)
            .navigationTitle("Contacts")
            .navigationBarItems(trailing:  NavigationLink(destination: AddNewContactScreen(), label: {
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

struct ContactScreen_Previews: PreviewProvider {
    static var previews: some View {
        ContactScreen()
    }
}

struct SearchView: View {
    @State var textFiledSearchValue : String = ""
    
    @Binding var searchTerm : String

    var body: some View{
        HStack(spacing: 10){
            Image("glass")
                .resizable()
                .scaledToFit()
                .frame(width: 20, height: 20)
                .padding(.leading, 10)
            
            TextField("Search", text: $searchTerm)
                .font(.headline)
            
            Image("dismiss")
                .resizable()
                .frame(width: 20, height: 20)
                .padding(.trailing, 10)


        }
        .frame(height: 50)
        .background(Color("darkblue").opacity(0.3))
        .cornerRadius(8)
    }
}

struct FavoriteView : View{
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
                        ContactItemView(data: item )
                    }
                    .padding(.leading, 10)
                }
            }
            
            
           
        }
        //.frame(width: UIScreen.main.bounds.width - 20)
        .padding(.vertical)
        
        
    }
}

struct SectionContactView: View{
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
                        //GroupItemView(data: groupItem)
                        ContactItemView(data: item )
                    }.padding(.leading, 10)
                }
                //.frame(width: UIScreen.main.bounds.width - 20)
                .padding(.vertical)
            }
            
        }
        

      
    }
}

struct GroupView : View{
    
    @ObservedObject var data = ContactViewModel.init()
    var searchTerm = ""
    @Binding var isContactScreenShowing: Bool

    
    var body: some View{
        VStack(alignment: .leading, spacing: 10){
            Text("Group(5)")
                .font(.subheadline)
                .foregroundColor(Color("darkblue"))
                .fontWeight(.black)
                .padding(.leading,10)
            
            ScrollView(.horizontal, showsIndicators: false){
                HStack(spacing: 10){
                    
                    ZStack{
                        Rectangle().frame(width: 100, height: 100)
                            .foregroundColor(Color("darkblue"))
                            .cornerRadius(10)
                        
                        VStack(alignment: .center, spacing: 5){
                            Image("group")
                                .resizable()
                                .frame(width:50,height: 50)
                            
                            Text("Add New")
                                .foregroundColor(Color.white)
                        }
                        
                    }.onTapGesture{
                       
                        self.isContactScreenShowing = true
                    }.sheet(isPresented: self.$isContactScreenShowing){
                        AddNewGroupScreen(isPrensented: self.$isContactScreenShowing)
                    }
                    
                    ForEach(data.groupDictionary.keys.sorted(), id:\.self) { key in
                        if let groups = data.groupDictionary[key]!.filter({ (contact) -> Bool in
                            self.searchTerm.isEmpty ? true :
                            "\(contact)".lowercased().contains(self.searchTerm.lowercased())}), !groups.isEmpty
                        {
                            ForEach(groups.self){ groupItem in
                                GroupItemView(data: groupItem)
                            }
                        }
                    }
                    
                   
                                
                }.padding(.leading,10)
            }
            
        }
    }
}
