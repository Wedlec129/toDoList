//
//  ContentView.swift
//  toDoList
//
//  Created by Борух Соколов on 09.08.2023.
//

import SwiftUI

struct ListView: View {
    
    
    
    @EnvironmentObject var listViewModel: ListViewModels
    
    var body: some View {
        
        ZStack{
            //если список пустой
            if listViewModel.items.isEmpty {
                
                NoItemsView()
                    .transition(AnyTransition.opacity.animation(.linear))
            }
            else {
                List{
                    ForEach(listViewModel.items) { item in
                        listRowView(item: item)
                            .onTapGesture {
                                withAnimation(.linear){
                                    listViewModel.updateItem(item: item)
                                    
                                }
                            }
                    }
                    .onDelete(perform: listViewModel.deleteItem)
                    .onMove(perform: listViewModel.moveItem)
                    
                }
            }
            
        }
        
        
        .navigationBarItems(
            leading: EditButton(),
            trailing:
                NavigationLink("Add",destination: addNotsView())
        )
        .navigationTitle("Todo List")
        
    }
    
    
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        
        NavigationView {
            ListView()
        }
        .environmentObject(ListViewModels())
        .navigationViewStyle(StackNavigationViewStyle())
    }
}
