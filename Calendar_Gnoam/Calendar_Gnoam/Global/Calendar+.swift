//
//  Calendar+.swift
//  Calendar_Gnoam
//
//  Created by Roh on 4/20/24.
//

import Foundation

// MARK: - Static 프로퍼티
extension CalendarView {
    static let weekdaySymbol: [String] = {
        let symbol = Calendar.current.veryShortWeekdaySymbols
        let modifiedWeekdaySymbols = symbol.map {
            $0.uppercased()
        }
        return modifiedWeekdaySymbols
    }()
    
    static let weekdaySymbols: [String] = {
        let symbol = Calendar.current.shortStandaloneWeekdaySymbols
        let modifiedWeekdaySymbols = symbol.map {
            $0.uppercased()
        }
        return modifiedWeekdaySymbols
    }()
    
    /// 월 변경
    func changeMonth(by value: Int) {
        let calendar = Calendar.current
        if let newMonth = calendar.date(byAdding: .month, value: value, to: month) {
            self.month = newMonth
        }
    }
}
