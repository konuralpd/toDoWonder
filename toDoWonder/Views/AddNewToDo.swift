//
//  AddNewToDo.swift
//  toDoWonder
//
//  Created by Mac on 29.06.2022.
//

import SwiftUI

struct AddNewToDo: View {
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var listViewModel: ListViewModel
    @State var textFieldText: String = ""
    @State var alertTitle: String = ""
    @State var showAlert: Bool = false
    var body: some View {
        ScrollView {
            
            VStack {
                TextField("Yapılacak girin...", text: $textFieldText).padding().frame(height: 50)
                    .background(Color.gray.opacity(0.2)).cornerRadius(25)
                Button {
                   saveButtonClicked()
                } label: {
                    Text("Kaydet")
                        .frame(width: 120, height: 55)
                        .frame(maxWidth:.infinity)
                        .foregroundColor(.white)
                        .background( LinearGradient(
                            gradient: .init(colors: [Color.white, Color.purple.opacity(0.75)]),
                            startPoint: .init(x: -0.33, y: -0.33),
                            endPoint: .init(x: 0.66, y: 0.66)))
                        
                        .cornerRadius(10)
                    
                }

                
            }.padding()
        }.navigationTitle("Yapılacak Ekle 🖍")
            .alert(isPresented: $showAlert) {
                getAlert()
            }
    }
    func saveButtonClicked() {
        
        if textIsAppropriate() {
            listViewModel.addItem(title: textFieldText)
            presentationMode.wrappedValue.dismiss()
        } else {
        
        }
        
    }
    
    func textIsAppropriate() -> Bool {
        if textFieldText.count < 3 {
            alertTitle = "3 Karakterden fazla girmelisiniz.😓"
            showAlert.toggle()
            return false
        }
        return true
    }
    func getAlert() -> Alert {
        return Alert(title: Text(alertTitle))
    }
}

struct AddNewToDo_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AddNewToDo()
        }.environmentObject(ListViewModel())
      
    }
}
