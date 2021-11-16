//
//  RowView.swift
//  Checklist
//
//  Created by Nadya K on 16.11.2021.
//

import SwiftUI

struct RowView: View {
    @Binding var checklistItem: ChecklistItem
    
      var body: some View {
        NavigationLink(destination: EditChecklistItemView(checklistItem: $checklistItem)) {
            HStack {
                Text(checklistItem.name)
                Spacer()
                Text(checklistItem.isChecked ? "✅" : "🔲")
            }
        }
    }
}

struct RowView_Previews: PreviewProvider {
    static var previews: some View {
        RowView(checklistItem: .constant(ChecklistItem(name: "Sample item")))
    }
}
