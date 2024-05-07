//
//  DateExtension.swift
//  AnniversaryCalculatorDemo
//
//  Created by chenyilong on 2022/8/15.
//

import Foundation
extension Date {
    static func ISOStringFromDate(date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.timeZone = TimeZone(abbreviation: "GMT")
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS"

        return dateFormatter.string(from: date).appending("Z")
    }

    static func dateFromISOString(string: String) -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.timeZone = TimeZone.autoupdatingCurrent
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"

        return dateFormatter.date(from: string)
    }

    func after(days: Int) -> Date {
        var dayComponent = DateComponents()
        dayComponent.day = days // For removing one day (yesterday): -1
        let theCalendar = Calendar.current
        guard let nextDate = theCalendar.date(byAdding: dayComponent, to: Date()) else { return Date() }

        let dateComponents = theCalendar.dateComponents([.year, .month, .day], from: nextDate)
        guard let date = theCalendar.date(from: dateComponents) else { return Date() }
        return date
    }

    static func gapYears(date: Date) -> Int {
        let calendar = Calendar.current
        let componentsPast = calendar.dateComponents([.year], from: date)
        let componentsNow = calendar.dateComponents([.year], from: Date())
        let yearPast: Int = componentsPast.year ?? 0
        let yearNow: Int = componentsNow.year ?? 0
        return yearNow - yearPast
    }

    static func thisYearDate(pastDate: Date) -> Date {
        let calendar = Calendar.current

        var dateComponents = calendar.dateComponents([.year, .month, .day], from: pastDate)
        dateComponents.year = Calendar.current.component(.year, from: Date())
        guard let date = calendar.date(from: dateComponents) else { return Date() }
        return date
    }
}
