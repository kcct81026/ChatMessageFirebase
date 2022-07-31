//
//  AddNewContactScreen.swift
//  WeChat
//
//  Created by KC on 27/07/2022.
//

import SwiftUI
import CodeScanner

struct AddNewContactScreen: View {
    
    @State var isPresentingScanner = false
    @State var scannedCode : String = ""
    
    var body: some View {
        VStack(alignment:.leading, spacing: 10){
            
            ZStack{
                Rectangle().frame(width: UIScreen.main.bounds.width - 40, height: 100)
                    .foregroundColor(Color.white)
                    .background(Color.white)
                    .cornerRadius(10)
                
                VStack(spacing: 10){
                    Text("Tap to Scan")
                        .font(.subheadline)
                        .foregroundColor(Color.black)
                        .fontWeight(.bold)
                    Text("Scan the QR code to add your friend in contact")
                        .font(.subheadline)
                        .foregroundColor(Color.black)
                }
                
            }
            .shadow(color: .gray, radius: 4, x: 0, y: 5)
            .padding(.top, 20)
            .onTapGesture{
                self.isPresentingScanner = true
            }
            .sheet(isPresented: $isPresentingScanner){
                self.scannerSheet
            }
            
            Spacer()
            
            ZStack{
                Rectangle().frame(width: UIScreen.main.bounds.width - 40, height: 50)
                    .foregroundColor(Color.white)
                    .background(Color.white)
                    .cornerRadius(10)
                
                HStack(spacing: 10){
                    Image("gallery")
                        .resizable()
                        .frame(width: 24, height: 24)
                    Text("Select Image For QR Scan")
                        .font(.subheadline)
                        .foregroundColor(Color.black)
                }
                
            }.shadow(color: .gray, radius: 4, x: 0, y: 5)
            .padding(.bottom, 50)

        }
        
    }
    
    
    var scannerSheet: some View{
        CodeScannerView(
            codeTypes: [.qr] ,
            completion: { result in
                if case let .success(code) = result {
                    self.scannedCode = code.string
                    self.isPresentingScanner = false
                    print("scan result \(self.scannedCode)")
                }
            })
    }
}

struct AddNewContactScreen_Previews: PreviewProvider {
    static var previews: some View {
        AddNewContactScreen()
    }
}
