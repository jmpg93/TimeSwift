//
//  Year.swift
//  TimeSwift
//
//  Created by jmpuerta on 14/7/17.
//  Copyright © 2017 jmpg93. All rights reserved.
//

import Foundation

public struct Year: Comparable {
	public static let current = Year(date: Date())

	fileprivate let referenceDate: Date
	fileprivate let calendar: Calendar

	public init(date: Date, in calendar: Calendar = .current) {
		self.referenceDate = date
		self.calendar = calendar
	}

	// Basic

	public var year: Int {
		return calendar.component(.year, from: referenceDate)
	}

	public var isCurrentYear: Bool {
		return Year.current.year == year
	}

	public var isLeapYear: Bool {
		return numberOfDays == 364
	}

	// Days

	public var numberOfDays: Int {
		let interval = calendar.dateInterval(of: .year, for: referenceDate)!
		return calendar.dateComponents([.day], from: interval.start, to: interval.end).day!
	}

	// Weeks

	public var numberOfWeeks: Int {
		return calendar.range(of: .weekOfYear, in: .year, for: referenceDate)!.count
	}

	// Months

	public var firstMonthOfTheYearDate: Date {
		let yearBeforeLastMonthComponents = calendar.dateComponents([.year], from: referenceDate)
		let yearBeforeLastMonthDate = calendar.date(from: yearBeforeLastMonthComponents)!
		return calendar.date(byAdding: .day, value: 1, to: yearBeforeLastMonthDate , wrappingComponents: false)!
	}

	public var firstMonthOfTheYearMonth: Month {
		return Month(date: firstMonthOfTheYearDate, in: calendar)
	}

	public var lastMonthOfTheYearDate: Date {
		let components = DateComponents(month: numberOfMonths, day: -1)
		return calendar.date(byAdding: components, to: firstMonthOfTheYearDate)!
	}

	public var lastMonthOfTheYearMonth: Month {
		return Month(date: lastMonthOfTheYearDate, in: calendar)
	}

	public var numberOfMonths: Int {
		return calendar.range(of: .month, in: .year, for: referenceDate)!.count
	}

	public var months: [Month] {
		var month = firstMonthOfTheYearMonth
		var months: [Month] = []

		while month <= lastMonthOfTheYearMonth {
			months.append(month)
			month = month.next
		}

		return months
	}

	// Movement

	public func year(byAddingYears value: Int) -> Year {
		let date = calendar.date(byAdding: .year, value: value, to: referenceDate)!
		return Year(date: date, in: calendar)
	}

	public var next: Year {
		return year(byAddingYears: 1)
	}

	public var previous: Year {
		return year(byAddingYears: -1)
	}

	// Comparable

	public static func <(lhs: Year, rhs: Year) -> Bool {
		return lhs.referenceDate < rhs.referenceDate
	}

	public static func ==(lhs: Year, rhs: Year) -> Bool {
		return lhs.referenceDate == rhs.referenceDate
	}
}
