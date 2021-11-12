//
//  Checklist.swift
//  Checklist
//
//  Created by Nadya K on 12.11.2021.
//

import Foundation

class Checklist: ObservableObject {
    
    @Published var items = [
        ChecklistItem(name: "Walk the dog", isChecked: false),
        ChecklistItem(name: "Brush my teeth", isChecked: false),
        ChecklistItem(name: "Learn iOS development", isChecked:
    true),
        ChecklistItem(name: "Soccer practice", isChecked: false),
        ChecklistItem(name: "Eat ice cream", isChecked: true),
      ]
    
    
    // Methods
    // =======
    func deleteListItem(whichElement: IndexSet) {
      items.remove(atOffsets: whichElement)
    }
    
    func moveListItem(whichElement: IndexSet, destination: Int) {
      items.move(fromOffsets: whichElement, toOffset:
    destination)
    }
}
