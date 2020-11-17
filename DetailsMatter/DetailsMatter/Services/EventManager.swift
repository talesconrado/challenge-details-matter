//
//  EventManager.swift
//  DetailsMatter
//
//  Created by Pedro Sousa on 30/09/20.
//  Copyright © 2020 Tales Conrado. All rights reserved.
//

import EventKit
import UserNotifications

class EventManager {

    private let eventStore = EKEventStore()
    private let userDefaults = UserDefaults.standard
    private let calendar = Calendar.current

    private func checkAuthorizationStatusEK() -> Bool {
        switch EKEventStore.authorizationStatus(for: EKEntityType.reminder) {
        case EKAuthorizationStatus.authorized:
            return true
        case EKAuthorizationStatus.denied:
            return false
        case EKAuthorizationStatus.notDetermined:
            return self.requestAccess(completion: nil)
        default:
            return false
        }
    }

    @discardableResult
    public func requestAccess(completion: (() -> Void)?) -> Bool {
        var status: Bool = false
        self.eventStore.requestAccess(
            to: .reminder,
            completion: { (granted: Bool, error: Error?) in
                if let error = error {
                    print("EventManager Error - Request Access Error: \(error)")
                }
                if let completion = completion {
                    completion()
                }
                status = granted
            }
        )
        return status
    }

    @discardableResult
    public func createReminder(activity: ActivityModel) -> Bool {
        let reminder: EKReminder = EKReminder(eventStore: self.eventStore)
        reminder.title = activity.name

        // Adding the alarm
        guard let startDate = activity.startDate else {
            print("EventManager Error - The reminder's start date is invalid.")
            return false
        }
        let alarm: EKAlarm = EKAlarm(absoluteDate: startDate)
        reminder.addAlarm(alarm)

        // Adding the recurrence rule
        // Excluding one-time activity
        if activity.repeating > 0 {
            let recurrenceRule = self.createRecurenceRule(repeating: activity.repeating,
                                                          endDate: activity.stopRepeating!)
            reminder.addRecurrenceRule(recurrenceRule)
        }

        if self.saveReminder(reminder: reminder) {
            activity.reminderID = reminder.calendarItemIdentifier
            return true
        } else {
            return false
        }
    }

    private func saveReminder(reminder: EKReminder) -> Bool {
        do {
            try eventStore.save(reminder, commit: true)
            return true
        } catch {
            return false
        }
    }

//    public func deleteReminder(reminderID: String) -> Bool {}
//    public func editReminder(activity: ActivityModel) -> Bool {}

    private func createRecurenceRule(repeating: Int, endDate: Date) -> EKRecurrenceRule {
        var frequency: EKRecurrenceFrequency = .daily
        var interval: Int = 1
        let end = EKRecurrenceEnd(end: endDate)

        switch repeating {
        case 2:
            frequency = .weekly
        case 3:
            frequency = .weekly
            interval = 2
        case 4:
            frequency = .monthly
        default:
            frequency = .daily
        }

        let rule = EKRecurrenceRule(recurrenceWith: frequency, interval: interval, end: end)
        return rule
    }
}
