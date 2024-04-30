//
//  Utility.swift
//  Calendar_Gnoam
//
//  Created by Roh on 4/22/24.
//

import Foundation

class Utility {
//    static func weekdaySymbols() -> [String] {
//        let calendar = Calendar.current.shortStandaloneWeekdaySymbols
//        let modifiedWeekdaySymbols = calendar.map {
//            $0.uppercased()
//        }
//        return modifiedWeekdaySymbols
//    }
    
    static func dateFromString(month: Int, year: Int, day: Int) -> Date {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy/MM/dd"
        return dateFormatter.date(from: "\(addPadding(year, 4))/\(addPadding(month, 2))/\(addPadding(day, 2))")!
    }
    
    private static func addPadding(_ int: Int, _ targetDigit: Int ) -> String {
        return String(format: "%0\(targetDigit)d", int)
    }
}

