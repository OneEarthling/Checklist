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
    @State var newChecklistItemViewIsVisible = false

    var body: some View {
        NavigationView {
            List {
                ForEach(checklist.items) { index in
                    RowView(checklistItem: $checklist.items[index])
                }
                .onDelete(perform: checklist.deleteListItem)
                .onMove(perform: checklist.moveListItem)                
            }
            .navigationBarItems(leading: Button(action: { self.newChecklistItemViewIsVisible = true }) {
                    HStack {
                      Image(systemName: "plus.circle.fill")
                      Text("Add item")
                    }
                },
                trailing: EditButton()
            )
            .navigationBarTitle("Checklist", displayMode: .inline)
        }
        .sheet(isPresented: $newChecklistItemViewIsVisible) {
                NewChecklistItemView(checklist: self.checklist)
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

