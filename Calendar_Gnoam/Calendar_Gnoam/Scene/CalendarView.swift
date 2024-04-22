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
    
    var body: some View {
        
        VStack {
            headerView
            ScrollView(.vertical) {
                LazyVStack {
//                    ForEach(calendarModel.)
                }
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
}


#Preview {
    CalendarView()
}
