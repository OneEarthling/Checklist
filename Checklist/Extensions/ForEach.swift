//
//  ForEach.swift
//  Checklist
//
//  Created by Nadya K on 16.11.2021.
//

import SwiftUI

public extension ForEach where Content: View {
  init<Base: RandomAccessCollection>(
    _ base: Base,
    @ViewBuilder content: @escaping (Data.Element) -> Content
  )
  where
    Data == IndexedCollection<Base>,
    Base.Element: Identifiable,
    ID == Base.Element.ID {
    self.init(IndexedCollection(base: base), id: \.element.id, content: content)
  }

  init<Base: RandomAccessCollection>(
    _ base: Base,
    @ViewBuilder content: @escaping (Data.Index) -> Content
  )
  where
    Data == IndexedCollection<Base>,
    Base.Element: Identifiable,
    ID == Base.Element.ID {
    self.init(base) { index, _ in content(index) }
  }
}
