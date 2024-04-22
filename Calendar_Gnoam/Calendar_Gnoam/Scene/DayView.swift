//
//  CalendarCellView.swift
//  Calendar_Gnoam
//
//  Created by Roh on 4/19/24.
//

import SwiftUI

struct DayView: View {
    var dayModel: DayModel
    
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
                        .fill( isToday ? Color.red : Color.white )
                        .frame(width: 35, height: 35, alignment: .center)
                    )
                
                Text("MNG")
                    .padding(.vertical, 2)
                    .padding(.horizontal, 8)
                    .font(.system(size: 8))
                    .fontWeight(
                        isToday ? Font.Weight.bold : Font.Weight.regular
                    )
                    .foregroundStyle(foregroundColor)
                    .background(Rectangle()
                        .fill( isToday ? Color.gray : Color.white )
//                        .frame(width: 35, height: 35, alignment: .center)
                    )
                
                Text("DAY")
                    .padding(.vertical, 2)
                    .padding(.horizontal, 8)
                    .font(.system(size: 8))
                    .fontWeight(
                        isToday ? Font.Weight.bold : Font.Weight.regular
                    )
                    .foregroundStyle(foregroundColor)
                    .background(Rectangle()
                        .fill( isToday ? Color.gray : Color.white )
//                        .frame(width: 35, height: 35, alignment: .center)
                    )
                
                Text("EVN")
                    .padding(.vertical, 2)
                    .padding(.horizontal, 8)
                    .font(.system(size: 8))
                    .fontWeight(
                        isToday ? Font.Weight.bold : Font.Weight.regular
                    )
                    .foregroundStyle(foregroundColor)
                    .background(Rectangle()
                        .fill( isToday ? Color.gray : Color.white )
//                        .frame(width: 35, height: 35, alignment: .center)
                    )
                
                Text("NGT")
                    .padding(.vertical, 2)
                    .padding(.horizontal, 8)
                    .font(.system(size: 8))
                    .fontWeight(
                        isToday ? Font.Weight.bold : Font.Weight.regular
                    )
                    .foregroundStyle(foregroundColor)
                    .background(Rectangle()
                        .fill( isToday ? Color.gray : Color.white )
//                        .frame(width: 35, height: 35, alignment: .center)
                    )
                
                if (hasEvent) {
                    Circle()
                        .fill(Color(UIColor.gray))
                        .frame(width: 8, height: 8)
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

