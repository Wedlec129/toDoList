//
//  ItemModel.swift
//  toDoList
//
//  Created by Борух Соколов on 09.08.2023.
//

import SwiftUI
import Foundation

// Immutable Struct has only 'let' constants
//codeble is decode + encode
struct ItemModel: Identifiable, Codable{
    let id :String
    let tittle :String
    let isComlpited :Bool
    
    //конструктор с не обязательным (п умолчанию) поле id
    init(id: String = UUID().uuidString ,tittle: String, isComlpited: Bool) {
        self.id = id
        self.tittle = tittle
        self.isComlpited = isComlpited
    }
    
    //типо обновляем модели
    //замнняя константы на такие же констаны
    func updateComplecation() -> ItemModel {
        return ItemModel(id: id, tittle: tittle, isComlpited: !isComlpited)
    }
    
}

