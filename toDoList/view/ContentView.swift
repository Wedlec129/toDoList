//
//  ContentView.swift
//  toDoList
//
//  Created by Борух Соколов on 09.08.2023.
//

import SwiftUI

struct ContentView: View {
    

    
    @EnvironmentObject var listViewModel: ListViewModels
    
    var body: some View {
       
        NavigationView(){
            List{
                ForEach(listViewModel.items) { item in
                    listRowView(item: item)
                }
                .onDelete(perform: listViewModel.deleteItem)
                .onMove(perform: listViewModel.moveItem)
                
                
            }
            .navigationBarItems(
                leading: EditButton(),
                trailing:
                    NavigationLink("Add",destination: addNotsView())
            )
            .navigationTitle("Todo List")
        }
       
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ListViewModels())
    }
}
