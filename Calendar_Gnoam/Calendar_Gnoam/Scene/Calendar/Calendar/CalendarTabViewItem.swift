//
//  CalendarTabViewModel.swift
//  Calendar_Gnoam
//
//  Created by Roh on 4/29/24.
//

import Foundation

enum CalendarTabViewItem: String {
    case calendar = "Calendar"
    case check = "Check"
    case event = "Event"
    case alarm = "Alarm"
    
    var iconEnable : String {
        switch self {
        case .calendar:
            return "CalendarEnableIcon"
        case .check:
            return "CheckEnableIcon"
        case .event:
            return "EventEnableIcon"
        case .alarm:
            return "AlarmEnableIcon"
        }
    }
    
    var iconDisable : String {
        switch self {
        case .calendar:
            return "CalendarDisableIcon"
        case .check:
            return "CheckDisableIcon"
        case .event:
            return "EventDisableIcon"
        case .alarm:
            return "AlarmDisableIcon"
        }
    }
}
