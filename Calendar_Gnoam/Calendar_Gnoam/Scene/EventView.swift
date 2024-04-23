//
//  EventView.swift
//  Calendar_Gnoam
//
//  Created by Roh on 4/23/24.
//

import SwiftUI

struct EventView: View {
    var msg: String
    var isToday: Bool
    var foregroundColor: Color
    
    var body: some View {
        Text(msg)
            .padding(.vertical, 2)
            .padding(.horizontal, 8)
            .font(.system(size: 8))
            .fontWeight(
                isToday ? Font.Weight.bold : Font.Weight.regular
            )
            .foregroundStyle(foregroundColor)
            .background(Rectangle()
                .fill( isToday ? Color.gray : Color.white )
            )
    }
}
