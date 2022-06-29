//
//  ListView.swift
//  toDoWonder
//
//  Created by Mac on 29.06.2022.
//

import SwiftUI

struct ListView: View {
    
    @EnvironmentObject var listViewModel: ListViewModel
    
   
    var body: some View {
        VStack {
            List {
                ForEach(listViewModel.items) { item in
                    ListRowView(item: item)
                        .onTapGesture {
                            withAnimation(.linear) {
                                listViewModel.updateItem(item: item)
                            }
                        }
                }.onDelete(perform: listViewModel.deleteItem(indexSet:))
                    .onMove(perform: listViewModel.moveItem(from:to:))
                    .listStyle(PlainListStyle())
            }.navigationTitle("toDoWonder🗓").navigationBarItems(leading: EditButton(), trailing: NavigationLink("Oluştur", destination: AddNewToDo()))
        }
       
       
        

    }
  
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ListView()
        }
        
    }
}



