//
//  NewChecklistItemView.swift
//  Checklist
//
//  Created by Nadya K on 15.11.2021.
//

import SwiftUI

struct NewChecklistItemView: View {
    var checklist: Checklist
    @State var newItemName = ""
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack {
          Text("Add new item")
          Form {
            TextField("Enter new item name here", text: $newItemName)
              Button(action: {
                var newChecklistItem = ChecklistItem(name: newItemName)
                checklist.items.append(newChecklistItem)
                presentationMode.wrappedValue.dismiss()
              }) {
                HStack {
                  Image(systemName: "plus.circle.fill")
                  Text("Add new item")
                }
              }.disabled(newItemName.count == 0)
          }
          Text("Swipe down to cancel.")
        }
    }
    
}

struct NewChecklistItemView_Previews: PreviewProvider {
    static var previews: some View {
        NewChecklistItemView(checklist: Checklist())
    }
}
