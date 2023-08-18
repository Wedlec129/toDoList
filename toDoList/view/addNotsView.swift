//
//  addNotsView.swift
//  toDoList
//
//  Created by Борух Соколов on 09.08.2023.
//

import SwiftUI

struct addNotsView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    
    @EnvironmentObject var listViewModel: ListViewModels
    @State var textFiledText = ""
    
    @State var alertTittle: String = ""
    @State var showAlert: Bool = false
    
    
    var body: some View {
        NavigationView(){
            ScrollView{
                VStack{
                    TextField("type something here", text: $textFiledText)
                        .padding(.horizontal)
                        .frame(height: 55)
                        .background(Color(.secondarySystemBackground))
                        .cornerRadius(10)
                    
                    Button(action: saveButton, label: {
                        Text("Save")
                            .foregroundColor(.white)
                            .font(.headline)
                            .frame(height: 55)
                            .frame(maxWidth: .infinity)
                            .background(textIsApproprte() ? Color.accentColor : Color.secondary)
                            .cornerRadius(10)
                    })
                   
                    
                }
                .padding(14)
            }
            
            .navigationTitle("Add an item")
            .alert(isPresented: $showAlert, content: getAlert )
        }
    }
    
    func saveButton(){
        if textIsApproprte(){
            listViewModel.addItem(tittle: textFiledText)
            presentationMode.wrappedValue.dismiss()
        }
        
    }
    func textIsApproprte() -> Bool {
        if textFiledText.count < 3 {
            alertTittle = "you need write minimum 3 charactrs long! "
            showAlert.toggle()
            return false
        }
        else{
            return true
        }
    }
    
    func getAlert() -> Alert {
        return Alert(title: Text(alertTittle))
    }
    
    
}

struct addNotsView_Previews: PreviewProvider {
    static var previews: some View {
        addNotsView()
            .environmentObject(ListViewModels())
    }
}
