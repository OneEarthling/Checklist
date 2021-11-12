//
//  ChecklistItem.swift
//  Checklist
//
//  Created by Nadya K on 12.11.2021.
//

import Foundation

struct ChecklistItem: Identifiable {
    let id = UUID()
    var name: String
    var isChecked: Bool = false
}
