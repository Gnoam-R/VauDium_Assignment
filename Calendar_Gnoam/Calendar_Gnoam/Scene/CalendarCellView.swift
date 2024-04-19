//
//  CalendarCellView.swift
//  Calendar_Gnoam
//
//  Created by Roh on 4/19/24.
//

import SwiftUI

// MARK: - 일자 셀 뷰
struct CalendarCellView: View {
  var day: Int
  var clicked: Bool = false
  
  init(day: Int, clicked: Bool) {
    self.day = day
    self.clicked = clicked
  }
  
  var body: some View {
    VStack {
      RoundedRectangle(cornerRadius: 5)
        .opacity(0)
        .overlay(Text(String(day)))
        .foregroundColor(.blue)
      
      if clicked {
        Text("Click")
          .font(.caption)
          .foregroundColor(.red)
      }
    }
  }
}
