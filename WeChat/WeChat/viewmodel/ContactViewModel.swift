//
//  ContactViewModel.swift
//  WeChat
//
//  Created by KC on 26/07/2022.
//

import Foundation

class ContactViewModel: ObservableObject{
    
    @Published var groupData: [GroupData] = []
    @Published var contactData : [ContactData] = []
    @Published var favoriteData: [ContactData] = []
    @Published var sectionDictionary : Dictionary<String , [ContactData]> = [:]
    @Published var groupDictionary : Dictionary<String , [GroupData]> = [:]
    @Published var favDictionary : Dictionary<String , [ContactData]> = [:]

    
    init(){
        getData()
    }
    
    func getData(){
        self.groupData.append(contentsOf: [
            GroupData(name: "Minion"),
            GroupData(name: "Office"),
            GroupData(name: "Family")
        ])
        
        self.contactData.append(contentsOf: [
            ContactData(name: "Aye Aye"),
            ContactData(name: "David"),
            ContactData(name: "Frankie"),
            ContactData(name: "Aung Aung"),
            ContactData(name: "Eddie"),
            ContactData(name: "Erick"),
            ContactData(name: "Kenneth"),
            ContactData(name: "Mom")
        ])
        
        self.favoriteData.append(contentsOf: [
            ContactData(name: "Mom"),
            ContactData(name: "Frankie")
        ])
        
        self.sectionDictionary = getSectionedDictionary()
        self.favDictionary = getFavDictionary()
        self.groupDictionary = getGroupDictionary()
    }
    
    func getGroupDictionary() -> Dictionary <String , [GroupData]> {
            let groupDictionary: Dictionary<String, [GroupData]> = {
                return Dictionary(grouping: groupData, by: {
                    let name = $0.name
                    let normalizedName = name.folding(options: [.diacriticInsensitive, .caseInsensitive], locale: .current)
                    let firstChar = String(normalizedName.first!).uppercased()
                    return firstChar
                })
            }()
            return groupDictionary
    }
    
    func getFavDictionary() -> Dictionary <String , [ContactData]> {
            let groupDictionary: Dictionary<String, [ContactData]> = {
                return Dictionary(grouping: favoriteData, by: {
                    let name = $0.name
                    let normalizedName = name.folding(options: [.diacriticInsensitive, .caseInsensitive], locale: .current)
                    let firstChar = String(normalizedName.first!).uppercased()
                    return firstChar
                })
            }()
            return groupDictionary
    }
    
    
    func getSectionedDictionary() -> Dictionary <String , [ContactData]> {
            let sectionDictionary: Dictionary<String, [ContactData]> = {
                return Dictionary(grouping: contactData, by: {
                    let name = $0.name
                    let normalizedName = name.folding(options: [.diacriticInsensitive, .caseInsensitive], locale: .current)
                    let firstChar = String(normalizedName.first!).uppercased()
                    return firstChar
                })
            }()
            return sectionDictionary
        }
    

}

