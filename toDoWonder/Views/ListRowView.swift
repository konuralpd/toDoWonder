//
//  ListRowView.swift
//  toDoWonder
//
//  Created by Mac on 29.06.2022.
//

import SwiftUI

struct ListRowView: View {
    
    let item: ItemModel
    var body: some View {
        HStack {
            Image(systemName: item.isCompleted ? "checkmark.circle" : "circle")
                .foregroundColor(item.isCompleted ? .green : .red)
            Text(item.title)
            
        }.font(.title2)
    }
}

struct ListRowView_Previews: PreviewProvider {
    
    static var item1 = ItemModel(title: "Birinci Yapılacak", isCompleted: false)
    static var previews: some View {
        ListRowView(item: item1)
    }
}
