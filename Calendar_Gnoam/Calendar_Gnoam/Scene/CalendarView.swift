//
//  ContentView.swift
//  Calendar_Gnoam
//
//  Created by Roh on 4/17/24.
//

import SwiftUI

struct CalendarView: View {
    @State var month: Date = Date()
    @State var offset: CGSize = CGSize()
    @State var clickedDates: Set<Date> = []
    
    var body: some View {
        
        VStack {
            headerView
            ScrollView(.vertical) {
                LazyVStack {
//                    ForEach(calendarModel.)
                }
//                calendarGridView
            }
        }
        .gesture(
            DragGesture()
                .onChanged { gesture in
                    self.offset = gesture.translation
                }
                .onEnded { gesture in
                    if gesture.translation.width < -100 {
                        changeMonth(by: 1)
                    } else if gesture.translation.width > 100 {
                        changeMonth(by: -1)
                    }
                    self.offset = CGSize()
                }
        )
    }
    
    // MARK: - 헤더 뷰
    private var headerView: some View {
        VStack {
            Text(month, formatter: DateFormatter.MMMMYYYY)
                .font(.title)
                .padding(.bottom)
            
            HStack {
                ForEach(Self.weekdaySymbols, id: \.self) { symbol in
                    Text(symbol)
                        .frame(maxWidth: .infinity)
                }
            }
            .padding(.bottom, 5)
        }
    }
    
//    private var calendarGridView: some View {
//        let daysInMonth: Int = numberOfDays(in: month)
//        let firstWeekday: Int = firstWeekdayOfMonth(in: month) - 1
//        let calenderColumns = Array(repeating: GridItem(), count: 7)
//        
//        return VStack {
//            LazyVGrid(columns: calenderColumns) {
//                
//                ForEach(0 ..< daysInMonth + firstWeekday, id: \.self) { index in
//                    if index < firstWeekday {
//                        RoundedRectangle(cornerRadius: 5)
//                            .foregroundColor(Color.red)
//                    } else {
//                        let date = getDate(for: index - firstWeekday)
//                        let day = index - firstWeekday + 1
//                        let clicked = clickedDates.contains(date)
//                        let calendarCellView = DayView(day: day, clicked: clicked)
//                        
//                        calendarCellView
//                            .onTapGesture {
//                                if clicked {
//                                    clickedDates.remove(date)
//                                } else {
//                                    clickedDates.insert(date)
//                                }
//                            }
//                    }
//                    
//                }
//                
//            }
//        }
//    }
}


#Preview {
    CalendarView()
}
