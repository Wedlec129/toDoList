//
//  listRowView.swift
//  toDoList
//
//  Created by Борух Соколов on 09.08.2023.
//

import SwiftUI

struct listRowView: View {
    
    let item: ItemModel
 
    
    var body: some View {
        HStack{
            Image(systemName: item.isComlpited ? "checkmark.circle" : "circle")
                .foregroundColor(item.isComlpited ? .green : .red)
            Text(item.tittle)
            Spacer()
            
        }
        .font(.title2)
        .padding(.vertical,8)
    }
}

struct listRowView_Previews: PreviewProvider {
    static var previews: some View {
       
        Group{
            listRowView(item:ItemModel(tittle: "test", isComlpited: true))
            listRowView(item:ItemModel(tittle: "test", isComlpited: false))
        }
        .previewLayout(.sizeThatFits)
           
      
    }
}
