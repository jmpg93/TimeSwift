# TimeSwift
Syntax sugar to work with dates like you never did before!

## Day
```swift
let day = Day()

// Jumps
let tomorrow = day.nextm// Month
let yesterday = day.previous // Month
let nextWeekDay = day.day(byAddingDays: 7) // Month
let year = day.year // Year
let month = day.month // Month
let week = day.week // Week

// Info
let dayNumber = day.day // Int
let weekday = day.weekday // Int
let isCurrentDay = day.isCurrentDay // Bool
let isWeekend = day.isWeekend // Bool

// Symbols
let symbol = day.symbol // String
let shortSymbol = day.shortSymbol // String
let veryShortSymbol = day.veryShortSymbol // String
```
## Week

```swift
let week = Week()

// Jumps
let year = week.year // Year
let month = week.month // Month

// Info
let weekOfYear = week.weekOfYear // Int
let weekOfMonth = week.weekOfMonth // Int
let numberOfWeekdays = week.numberOfWeekdays // Int
let isCurrentDay = week.isCurrentWeek // Bool
```

## Month
```swift
let month = Month()

// Jumps
let nextMonth = month.next // Month
let previousMonth = month.previous // Month
let nextNextMonth = month.month(byAddingMonth: 2) // Month
let year = month.year // Year

// Info
let days = month.days // [Day]
let firstDayOfTheMonthDay = month.firstDayOfTheMonthDay // Day
let lastDayOfTheMonthDay = month.lastDayOfTheMonthDay // Day
let isCurrentMonth = month.isCurrentMonth // Bool
let isLeapMonth = month.isLeapMonth // Bool
let numberOfDays = month.numberOfDays // Int
let numberOfWeekdays = month.numberOfWeekdays // Int
let numberOfWeeks = month.numberOfWeeks // Int
let monthNumber = month.month // Int

// Symbols
let symbol = month.symbol // String
let shortSymbol = month.shortSymbol // String
let veryShortSymbol = month.veryShortSymbol // String
```

## Year
```swift
let year = Year()

// Jumps
let nextYear = year.next // Year
let previousYear = year.previous // Year
let nextNextYear = year.year(byAddingYears: 2) // Year

// Info
let days = year.months // [Month]
let firstMonthOfTheYearMonth = year.firstMonthOfTheYearMonth // Month
let lastMonthOfTheYearMonth = year.lastMonthOfTheYearMonth // Month
let isCurrentYear = year.isCurrentYear
let isLeapYear = year.isLeapYear
let numberOfDays = year.numberOfDays // Int
let numberOfWeeks = year.numberOfWeeks // Int
let numberOfMonths = year.numberOfMonths // Int
let monthNumber = year. // Int

// Symbols
let symbol = year.symbol // String
let shortSymbol = year.shortSymbol // String
let veryShortSymbol = year.veryShortSymbol // String
let monthSymbols = year.monthSymbols // [String]
let weekDaySymbols = year.weekDaySymbols // [String]
```
 
 ## Use custom dates or calendars
```swift
let dayByDate = Day(date: Date())
let dayByCalendar = Day(calendar: .current)
let day = Day(date: Date(), calendar: .current)
```
