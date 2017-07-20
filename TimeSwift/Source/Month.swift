//
//  Month.swift
//  TimeSwift
//
//  Created by jmpuerta on 14/7/17.
//  Copyright © 2017 jmpg93. All rights reserved.
//

import Foundation

public struct Month: Comparable {
	static let current: Month = Month(date: Date())

	fileprivate let referenceDate: Date
	fileprivate let calendar: Calendar

	public init(date: Date, in calendar: Calendar = .current) {
		self.referenceDate = date
		self.calendar = calendar
	}

	// Symbols

	public var symbol: String {
		return calendar.monthSymbols[month-1]
	}

	public var shortSymbol: String {
		return calendar.shortMonthSymbols[month-1]
	}

	public var veryShortSymbol: String {
		return calendar.veryShortMonthSymbols[month-1]
	}

	// Basic

	public var month: Int {
		return calendar.dateComponents([.month], from: referenceDate).month!
	}

	public var isCurrentMonth: Bool {
		return Month.current.month == month && year.isCurrentYear
	}

	public var isLeapMonth: Bool {
		return calendar.dateComponents([.year, .month], from: referenceDate).isLeapMonth!
	}

	// Weeks

	public var numberOfWeeks: Int {
		return calendar.range(of: .weekOfMonth, in: .month, for: referenceDate)!.count
	}

	public var weekdaySymbols: [String] {
		return calendar.weekdaySymbols
	}

	public var veryShorWeekdaySymbols: [String] {
		return calendar.veryShortWeekdaySymbols
	}
	
	// Days

	public var numberOfDays: Int {
		return calendar.range(of: .day, in: .month, for: referenceDate)!.count
	}

	public var numberOfWeekdays: Int {
		return Week(date: referenceDate, in: calendar).numberOfWeekdays
	}

	public var firstDayOfTheMonthDate: Date {
		let components = calendar.dateComponents([.year, .month], from: referenceDate)
		return calendar.date(from: components)!
	}

	public var firstDayOfTheMonthDay: Day {
		return Day(date: firstDayOfTheMonthDate)
	}

	public var lastDayOfTheMonthDate: Date {
		return calendar.date(byAdding: DateComponents(month: 1, day: -1), to: firstDayOfTheMonthDate)!
	}

	public var lastDayOfTheMonthDay: Day {
		return Day(date: lastDayOfTheMonthDate)
	}


	// Jumps

	public var year: Year {
		return Year(date: referenceDate, in: calendar)
	}

	// Jumps inverse

	public var days: [Day] {
		var day = firstDayOfTheMonthDay
		var days: [Day] = []

		while day <= lastDayOfTheMonthDay {
			days.append(day)
			day = day.next
		}

		return days
	}

	// Movement

	public func month(byAddingMonth value: Int) -> Month {
		let date = calendar.date(byAdding: .month, value: value, to: referenceDate)!
		return Month(date: date, in: calendar)
	}

	public var next: Month {
		return month(byAddingMonth: 1)
	}

	public var previous: Month {
		return month(byAddingMonth: -1)
	}

	// Comparable

	public static func <(lhs: Month, rhs: Month) -> Bool {
		return lhs.referenceDate < rhs.referenceDate
	}

	public static func ==(lhs: Month, rhs: Month) -> Bool {
		return lhs.referenceDate == rhs.referenceDate
	}
}
