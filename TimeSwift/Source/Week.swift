//
//  Week.swift
//  TimeSwift
//
//  Created by jmpuerta on 14/7/17.
//  Copyright © 2017 jmpg93. All rights reserved.
//

import Foundation

public struct Week: Comparable {
	public static let current = Week(date: Date())

	let referenceDate: Date
	let calendar: Calendar

	public init(date: Date, in calendar: Calendar = .current) {
		self.referenceDate = date
		self.calendar = calendar
	}

	// Basic

	public var weekOfMonth: Int {
		return calendar.dateComponents([.weekOfMonth], from: referenceDate).weekOfMonth!
	}

	public var weekOfYear: Int {
		return calendar.dateComponents([.weekOfYear], from: referenceDate).weekOfYear!
	}

	public var isCurrentWeek: Bool {
		return Week.current.weekOfYear == weekOfYear && month.isCurrentMonth && year.isCurrentYear
	}

	public var numberOfWeekdays: Int {
		return calendar.range(of: .weekday, in: .month, for: referenceDate)!.count
	}

	// Jumps

	public var month: Month {
		return Month(date: referenceDate, in: calendar)
	}

	public var year: Year {
		return Year(date: referenceDate, in: calendar)
	}

}
