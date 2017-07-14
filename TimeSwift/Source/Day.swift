//
//  Day.swift
//  TimeSwift
//
//  Created by jmpuerta on 14/7/17.
//  Copyright © 2017 jmpg93. All rights reserved.
//

import Foundation

public struct Day: Comparable {
	public static let current = Day(date: Date())

	fileprivate let referenceDate: Date
	fileprivate let calendar: Calendar

	public init(date: Date, in calendar: Calendar = .current) {
		self.referenceDate = date
		self.calendar = calendar
	}

	// Symbols

	public var symbol: String {
		return calendar.weekdaySymbols[weekday]
	}

	public var shortSymbol: String {
		return calendar.shortWeekdaySymbols[weekday]
	}

	public var veryShortSymbol: String {
		return calendar.veryShortWeekdaySymbols[weekday]
	}

	// Basic

	public var day: Int {
		return calendar.dateComponents([.day], from: referenceDate).day!
	}

	public var weekday: Int {
		return calendar.dateComponents([.weekday], from: referenceDate).weekday!.advanced(by: -1)
	}

	public var yearday: Int {
		return calendar.ordinality(of: .day, in: .year, for: referenceDate)!
	}

	public var isCurrentDay: Bool {
		return Day.current.day == day && month.isCurrentMonth && year.isCurrentYear
	}

	public var isWeekend: Bool {
		return calendar.isDateInWeekend(referenceDate)
	}

	// Jumps

	public var month: Month {
		return Month(date: referenceDate, in: calendar)
	}

	public var year: Year {
		return Year(date: referenceDate, in: calendar)
	}

	public var week: Week {
		return Week(date: referenceDate, in: calendar)
	}

	// Movement

	public func day(byAddingDays value: Int) -> Day {
		let date = calendar.date(byAdding: .day, value: value, to: referenceDate)!
		return Day(date: date, in: calendar)
	}

	public var next: Day {
		return day(byAddingDays: 1)
	}

	public var previous: Day {
		return day(byAddingDays: -1)
	}

	// Comparable

	public static func <(lhs: Day, rhs: Day) -> Bool {
		return lhs.referenceDate < rhs.referenceDate
	}

	public static func ==(lhs: Day, rhs: Day) -> Bool {
		return lhs.referenceDate == rhs.referenceDate
	}
}
