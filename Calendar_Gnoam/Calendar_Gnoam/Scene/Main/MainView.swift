//
//  MainView.swift
//  Calendar_Gnoam
//
//  Created by Roh on 4/29/24.
//

import SwiftUI

struct MainView: View {
    @State var selectedItem: Int = 0
    
    var body: some View {
        TabView(selection: $selectedItem) {
            CalendarView()
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
}

#Preview {
    MainView()
}
