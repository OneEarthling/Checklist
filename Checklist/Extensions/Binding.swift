//
//  Binding.swift
//  Checklist
//
//  Created by Nadya K on 16.11.2021.
//

import SwiftUI

public extension Binding where Value: CaseIterable & Equatable {
  var caseIndex: Binding<Value.AllCases.Index> {
    Binding<Value.AllCases.Index>(
      get: { Value.allCases.firstIndex(of: self.wrappedValue)! },
      set: { self.wrappedValue = Value.allCases[$0] }
    )
  }
}
