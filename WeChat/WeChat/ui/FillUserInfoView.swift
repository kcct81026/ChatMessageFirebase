//
//  FillUserInfoView.swift
//  WeChat
//
//  Created by KC on 24/07/2022.
//

import SwiftUI

struct FillUserInfoView: View {
    
    @Binding var isPrensented : Bool
    @State var textFieldPasswordValue: String = ""
    @State private var checked = false
    
    var body: some View {
        NavigationView{
            ScrollView {
                VStack(alignment:.leading, spacing: 10){
                    FillUserTopView()
                    
                    FillUserBodyView()
                
                    
                    RadioButtonGroups { selected in
                        print("Selected Gender is: \(selected)")
                    }
                    
                    
                    Text("Enter your password")
                        .foregroundColor(Color.black)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.top, 5)
                    
                    TextField("", text: $textFieldPasswordValue)
                        .font(.headline)
                               
                    Rectangle().frame(height: 1)
                        .foregroundColor(Color("darkblue"))
                    
                    HStack {
                        CheckboxView(checked: $checked)
                        Text("Agree To")
                            .foregroundColor(Color.gray)
                            .padding(.leading, 5)
                        Text("Term And Service")
                            .foregroundColor(Color.black)
                    }.padding(.top, 10)
                    
                    BlueBgTextView(text: "Sign Up", width: 150)
                        .padding()
                        .frame(maxWidth: .infinity)
                    
                   
                        
//                        .onTapGesture {
//                            self.isSplashShowing = true
//                        }.sheet(isPresented: $isSplashShowing, content: {
//                            LoginView(isPrensented: self.$isSplashShowing)
//                        }).padding()
                    
                        
                }

            }
            .padding(.trailing , 20).padding(.leading, 20)
                
                .navigationBarItems(leading: Button(action : {
                               // self.mode.wrappedValue.dismiss()
                    self.isPrensented = false
                }){
                    Image(systemName: "arrow.left")
            })
    }
}
    
struct BottomView: View{
    var body: some View{
        HStack(alignment: .top, spacing: 10) {

                    Rectangle()
                        .fill(Color.white)
                        .frame(width:20, height:20, alignment: .center)
                        .cornerRadius(5)
                    Text("Todo  item 1")
                }
    }
}

struct FillUserInfoView_Previews: PreviewProvider {
    static var previews: some View {
        FillUserInfoView(isPrensented: .constant(true))
    }
}

struct FillUserTopView: View {
    var body: some View {
        Text("Hi!")
            .font(.system(size: 40, weight: .bold))
            .foregroundColor(Color("darkblue"))
            .frame(maxWidth: .infinity, alignment: .leading)
        
        Text("Create a new account")
            .font(.headline)
            .foregroundColor(Color.gray)
            .frame(maxWidth: .infinity, alignment: .leading)
       
    }
}
}

struct DatePickerView: View{
    
    @State var date = Date()
    let dateRange: ClosedRange<Date> = {
        let calendar = Calendar.current
        let date = Date()
        var startComponents = calendar.dateComponents([.day, .month, .year], from: date)
        startComponents.day = 1
        startComponents.month = 1
        var endComponents = calendar.dateComponents([.day, .month, .year], from: date)
        endComponents.day = 31
        endComponents.month = 12
        return calendar.date(from:startComponents)!
        ...
        calendar.date(from:endComponents)!
      }()

    
    var body: some View{
        VStack{
            DatePicker("Date of Birth",
                           selection: $date,
                           in: dateRange,
                           displayedComponents: [.date])
            
            HStack{
                PickerTextView(text: "Day")
                PickerTextView(text: "Month")
                PickerTextView(text: "Year")

            }
            .padding(.bottom, 10)
        }
    }
  
    
}




struct FillUserBodyView: View {
    @State var textFieldNameValue: String = ""

    var body: some View {
        VStack{
            Text("Enter Your Name")
                .foregroundColor(Color.black)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.top, 5)
        
            TextField("", text: $textFieldNameValue)
                .font(.headline)
                       
            Rectangle().frame(height: 1)
                .foregroundColor(Color("darkblue"))
                .padding(.bottom, 10)
            
            DatePickerView()
            
            Text("Gender")
                .foregroundColor(Color.black)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.top, 20)
        }
    }
}
