//
//  Datable.swift
//  TimeSwift
//
//  Created by Jose Maria Puerta on 21/7/17.
//  Copyright © 2017 jmpg93. All rights reserved.
//

import Foundation

protocol Datable: Comparable {
	var referenceDate: Date { get }
	var calendar: Calendar { get }
}

extension Datable {
	public static func <(lhs: Self, rhs: Self) -> Bool {
		return lhs.referenceDate < rhs.referenceDate
	}

	public static func ==(lhs: Self, rhs: Self) -> Bool {
		return lhs.referenceDate == rhs.referenceDate
	}

	var next: Self {
		return self
	}
}

extension Day: Datable { }
extension Week: Datable { }
extension Month: Datable { }
extension Year: Datable { }
