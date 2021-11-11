//
//  ContentView.swift
//  Checklist
//
//  Created by Nadya K on 28.10.2021.
//

import SwiftUI

struct ContentView: View {
    // Properties
    // ==========
    @State var checklistItems = [
        ChecklistItem(name: "Walk the dog", isChecked: false),
        ChecklistItem(name: "Brush my teeth", isChecked: false),
        ChecklistItem(name: "Learn iOS development", isChecked:
    true),
        ChecklistItem(name: "Soccer practice", isChecked: false),
        ChecklistItem(name: "Eat ice cream", isChecked: true),
      ]
    
    var body: some View {
        NavigationView {
            List {
                ForEach(checklistItems) { item in
                    HStack {
                        Text(item.name)
                        Spacer()
                        Text(item.isChecked ? "✅" : "🔲")
                    }
                    .background(Color.white)
                    .onTapGesture {
                        if let matchingIndex = self.checklistItems.firstIndex(where: {
                        $0.id == item.id }) {
                            self.checklistItems[matchingIndex].isChecked.toggle()
                          }
                    }
                }
                .onDelete(perform: deleteListItem)
                .onMove(perform: moveListItem)                
            }
            .navigationBarItems(trailing: EditButton())
            .navigationBarTitle("Checklist")
        }
    }
    
    // Methods
    // =======
    
    func deleteListItem(whichElement: IndexSet) {
      checklistItems.remove(atOffsets: whichElement)
    }
    
    func moveListItem(whichElement: IndexSet, destination: Int) {
      checklistItems.move(fromOffsets: whichElement, toOffset:
    destination)
    }
}

// Preview
// =======

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct ChecklistItem: Identifiable {
    let id = UUID()
    var name: String
    var isChecked: Bool = false
}
