//
//  DataFormatter+.swift
//  Calendar_Gnoam
//
//  Created by Roh on 4/19/24.
//

import Foundation

extension DateFormatter {
    static let monthAndYear: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMMM yyyy"
        return formatter
    }()
}
