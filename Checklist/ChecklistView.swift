//
//  ContentView.swift
//  Checklist
//
//  Created by Nadya K on 28.10.2021.
//

import SwiftUI

struct ChecklistView: View {
    
    // Properties
    // ==========
    @ObservedObject var checklist = Checklist()
    
    var body: some View {
        NavigationView {
            List {
                ForEach(checklist.items) { item in
                    HStack {
                        Text(item.name)
                        Spacer()
                        Text(item.isChecked ? "✅" : "🔲")
                    }
                    .background(Color.white)
                    .onTapGesture {
                        if let matchingIndex = self.checklist.items.firstIndex(where: {
                        $0.id == item.id }) {
                            self.checklist.items[matchingIndex].isChecked.toggle()
                          }
                    }
                }
                .onDelete(perform: checklist.deleteListItem)
                .onMove(perform: checklist.moveListItem)                
            }
            .navigationBarItems(trailing: EditButton())
            .navigationBarTitle("Checklist")
        }
    }

    

}

// Preview
// =======

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ChecklistView()
    }
}

