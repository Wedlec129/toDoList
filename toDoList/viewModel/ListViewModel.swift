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
        let newItems: [ItemModel]=[
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
        let newItem = ItemModel(tittle: tittle, isComlpited: false)
        items.append(newItem)
    }
    
    func updateItem(item: ItemModel){
         
        //$0 это то на чем зацикливаемся
        if let index = items.firstIndex(where: { $0.id == item.id}){
            items[index] = item.updateComplecation()
           // print(index)
        }

        
        
        //тоже самое что и up
//        if let index = items.firstIndex { (existingItem) -> Bool in
//            return existingItem.id == item.id
//        } {
//            //run code
//        }
        
    }
    
    
}
