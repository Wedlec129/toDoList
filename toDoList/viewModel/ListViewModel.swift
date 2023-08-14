//
//  ListViewModel.swift
//  toDoList
//
//  Created by Борух Соколов on 09.08.2023.
//

import Foundation

class ListViewModels: ObservableObject{
    
    @Published var items: [ItemModel] = []
    
    init(){
        fetchData()
    }
    
    func fetchData(){
        var newItems: [ItemModel]=[
            ItemModel(tittle: "first", isComlpited: false),
            ItemModel(tittle: "second", isComlpited: true),
            ItemModel(tittle: "three", isComlpited: false)
        ]
        items.append(contentsOf: newItems)
    }
    
    func deleteItem(indexSet: IndexSet){
        items.remove(atOffsets: indexSet)
    }
    func moveItem(from: IndexSet, to: Int){
        items.move(fromOffsets: from, toOffset: to)
    }
    func addItem(tittle: String){
        var newItem = ItemModel(tittle: tittle, isComlpited: false)
        items.append(newItem)
    }
}
