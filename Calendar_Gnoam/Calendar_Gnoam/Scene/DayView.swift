//
//  CalendarCellView.swift
//  Calendar_Gnoam
//
//  Created by Roh on 4/19/24.
//

import SwiftUI

struct DayView: View {
    
    var dayModel: DayModel
    let messages = ["MNG", "DAY", "EVN", "NGT"]
    
    var body: some View {
        VStack(
            alignment: .center,
            spacing: 5
        ) {
            if let date = dayModel.date {
                let isToday =  date.isToday()
                let isWeekend = date.isWeekend()
                let hasEvent = dayModel.hasEvent
                let foregroundColor = isToday ? Color.white : isWeekend ? Color.red : Color.black
                
                Text("\(date.day())")
                    .padding(8)
                    .font(.system(size: 18))
                    .fontWeight(
                        isToday ? Font.Weight.bold : Font.Weight.regular
                    )
                    .foregroundStyle(foregroundColor)
                    .background(Circle()
                        .fill( isToday ? Color.purple : Color.white )
                        .frame(width: 35, height: 35, alignment: .center)
                    )
                
                if (hasEvent) {
                    ForEach(messages, id: \.self) { msg in
                        EventView(
                            msg: msg,
                            isToday: isToday,
                            foregroundColor: foregroundColor
                        )
                    }
                }
            }
            
        }
        .frame(width: 40, height: 120, alignment: .top)
        .padding(.vertical, 5)
    }
}


#Preview {
    VStack {
        DayView(dayModel: DayModel(Date()))
            .background(Color.purple)
    }
}

