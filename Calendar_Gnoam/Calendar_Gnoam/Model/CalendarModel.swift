//
//  CalendarModel.swift
//  Calendar_Gnoam
//
//  Created by Roh on 4/21/24.
//

import SwiftUI

class CalendarModel: ObservableObject {
    @Published var monthList: [MonthModel]
}

