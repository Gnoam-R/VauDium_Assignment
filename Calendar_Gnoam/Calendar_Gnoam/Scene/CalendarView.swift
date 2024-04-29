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
    
    @StateObject var calendarModel = CalendarModel()
    @State var monthId: MonthModel.ID?
    @State var showMonthLabel: Bool = false
    @State var viewInitialized: Bool = false
    
    @State private var selectedItem: Int = 0 // 0번째 탭이 기본적으로 선택됨
    
    var body: some View {
        TabView(selection: $selectedItem) {
            calendarView
                .tabItem {
                    Image(selectedItem == 0 ? CalendarTabViewItem.calendar.iconEnable : CalendarTabViewItem.calendar.iconDisable)
                    Text(CalendarTabViewItem.calendar.rawValue)
                }
                .tag(0)
            Text("Check")
                .tabItem {
                    Image(selectedItem == 1 ? CalendarTabViewItem.check.iconEnable : CalendarTabViewItem.check.iconDisable)
                    Text(CalendarTabViewItem.check.rawValue)
                }
                .tag(1)
            Text("Event")
                .tabItem {
                    Image(selectedItem == 2 ? CalendarTabViewItem.event.iconEnable : CalendarTabViewItem.event.iconDisable)
                    Text(CalendarTabViewItem.event.rawValue)
                }
                .tag(2)
            Text("Alarm")
                .tabItem {
                    Image(selectedItem == 3 ? CalendarTabViewItem.alarm.iconEnable : CalendarTabViewItem.alarm.iconDisable)
                    Text(CalendarTabViewItem.calendar.rawValue)
                }
                .tag(3)
        }
        .font(.headline)
    }
    
    // MARK: - Calendar 뷰
    private var calendarView: some View {
        VStack(
            alignment: .center,
            spacing: 0
        ) {
            headerView
            monthView
        }
        .gesture(
            DragGesture()
                .onChanged { gesture in
                    self.offset = gesture.translation
                }
                .onEnded { gesture in
                    print("check")
                    if gesture.translation.width < -100 {
                        changeMonth(by: 1)
                    } else if gesture.translation.width > 100 {
                        changeMonth(by: -1)
                    }
                    self.offset = CGSize()
                }
        )
    }
    
    // MARK: - header 뷰
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
    
    // MARK: - MonthCell 뷰
    private var monthView: some View {
        ZStack(
            alignment: .top
        ) {
            // month label
            if (showMonthLabel) {
                let displayMonthModel = calendarModel.monthModelFromId(monthId)
                
                Text(displayMonthModel.firstDayOfMonth.yearMonthString())
                    .font(.system(size: 20))
                    .fontWeight(Font.Weight.bold)
                    .foregroundStyle(Color.black)
                    .foregroundStyle(Color.red)
                    .frame(maxWidth: .infinity, alignment: .center)
                    .transition(.opacity)
                    .padding(.vertical, 5)
                    .background(Color.white)
                    .zIndex(2.0)
            }
            
            // scrollable monthly view
            ScrollView {
                LazyVStack {
                    ForEach(calendarModel.monthList) { monthModel in
                        MonthView(monthModel: monthModel)
                            .onAppear {
                                if monthModel == calendarModel.monthList.last{
                                    Task {
                                        await calendarModel.addMonthAfter(5)
                                    }
                                } else if monthModel ==  calendarModel.monthList.first {
                                    Task {
                                        await calendarModel.addMonthBefore(5)
                                    }
                                }
                            }
                    }
                }
                .scrollTargetLayout()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
            .scrollPosition(id: $monthId)
            .padding(.vertical, 10)
            .onAppear{ monthId = calendarModel.idForCurrentMonth() }
            .scrollIndicators(.hidden)
            .onChange(of: monthId, initial: false) {
                if ( !viewInitialized ) {
                    viewInitialized = true
                    return
                }
                showMonthLabel = true
                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                    withAnimation(.smooth) {
                        showMonthLabel = false
                    }
                }
            }
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
    }
}

#Preview {
    CalendarView()
}
