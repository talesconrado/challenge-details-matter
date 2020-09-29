//
//  DataManager.swift
//  DetailsMatter
//
//  Created by Tales Conrado on 23/09/20.
//  Copyright © 2020 Tales Conrado. All rights reserved.
//

import Foundation

private enum WeeksPassed {
    case twoWeeks
    case oneMonth
}

class ActivityRepository: Repository {
    typealias Item = ActivityModel
    var category: String = Category.activity.rawValue

    private let userDefaults = UserDefaults.standard
    private let today = Date()
    private let calendar = Calendar.current
    private let formatter = DateFormatter()

    public func getTodaysActivities() -> [ActivityModel] {
        formatter.dateFormat = "dd/MM/yyyy"
        let allActivities = self.readAllItems()

        let oneTimeActivity = allActivities.filter {
            $0.repeating == 0
            && formatter.string(from: $0.startDate!) == formatter.string(from: self.today)
        }

        let dailyOnRange = allActivities.filter {
            $0.repeating == 1
            && onRange($0.startDate!, $0.stopRepeating!)
        }

        let weeklyOnWeekday = allActivities.filter {
            $0.repeating == 2
            && onRange($0.startDate!, $0.stopRepeating!)
            && sameWeekdayAsToday(date: $0.startDate!)
        }

        let everyTwoWeeks = allActivities.filter {
            $0.repeating == 3
            && onRange($0.startDate!, $0.stopRepeating!)
            && weeksPassed(activity: $0, type: .twoWeeks)
        }

        let monthly = allActivities.filter {
            $0.repeating == 4
            && onRange($0.startDate!, $0.stopRepeating!)
            && weeksPassed(activity: $0, type: .oneMonth)
        }

        let todaysActivities = oneTimeActivity + dailyOnRange + weeklyOnWeekday + everyTwoWeeks + monthly
        return todaysActivities
    }

    private func onRange(_ start: Date, _ stop: Date) -> Bool {
        return (start...stop).contains(self.today)
    }

    private func sameWeekdayAsToday(date: Date) -> Bool {
        let startWeekDay = self.calendar.component(.weekday, from: date)
        let todayWeekday = self.calendar.component(.weekday, from: self.today)
        return startWeekDay == todayWeekday
    }

    private func weeksPassed(activity: ActivityModel, type: WeeksPassed) -> Bool {
        if let startDateStr = userDefaults.object(forKey: activity.identifier) as? String {
            guard let startDate = formatter.date(from: startDateStr) else {
                print("DataManager Error - Weeks Passed: Something went wrong trying to cast string to date.")
                return false
            }
            if type == .twoWeeks {
                if daysBetween(from: startDate, to: self.today) >= 14 {
                    userDefaults.set(formatter.string(from: self.today), forKey: activity.identifier)
                    return true
                }
            } else {
                if daysBetween(from: startDate, to: self.today) >= 30 {
                    userDefaults.set(formatter.string(from: self.today), forKey: activity.identifier)
                    return true
                }
            }
        }
        return false
    }

    private func daysBetween(from fromDate: Date, to toDate: Date) -> Int {
        let daysCoponent = calendar.dateComponents([.day], from: fromDate, to: toDate)
        if let days = daysCoponent.day {
            return days
        } else {
            print("DataManager Error - Days Between: Unable to unwrapp day from DateComponent.")
            return -1
        }
    }

    public func getWeekday(date: Date) -> String {
        switch calendar.component(.weekday, from: today) {
        case 1:
            return "Domingo"
        case 2:
            return "Segunda"
        case 3:
            return "Terça"
        case 4:
            return "Quarta"
        case 5:
            return "Quinta"
        case 6:
            return "Sexta"
        case 7:
            return "Sábado"
        default:
            fatalError("DataManager Error - Get Weekday: Nonexistent day.")
        }
    }
}

class VaccineRepository: Repository {
    typealias Item = VaccineModel
    var category: String = Category.vaccine.rawValue
}

class PetRepository: Repository {
    typealias Item = PetModel
    var category: String = Category.pet.rawValue
}

struct DataManager {
    static let activity = ActivityRepository()
    static let vaccine = VaccineRepository()
    static let pet = PetRepository()
}
