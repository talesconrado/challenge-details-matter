//
//  ActivityRepositoryTests.swift
//  DetailsMatterTests
//
//  Created by Tales Conrado on 28/09/20.
//  Copyright © 2020 Tales Conrado. All rights reserved.
//

import XCTest
@testable import DetailsMatter

class ActivityRepositoryTests: XCTestCase {

    var sut: ActivityRepository!
    var activitiesCreated: [String] = []

    override func setUp() {
        super.setUp()
        sut = ActivityRepository()
        populateWithActivities()
    }

    func populateWithActivities() {
        for _ in 0..<10 {
            let item = sut.createNewItem()
            activitiesCreated.append(item!.identifier)
        }
    }

    func test_filtering_firstId_equalsOneFiltered() {

        //when
        let ids = [activitiesCreated[0]]
        let filter = sut.filterByIds(from: ids)
        let filteredId = filter[0].identifier

        //then
        XCTAssertEqual(ids[0], filteredId)
    }

    func removeAllActivities() {
        for activity in sut.readAllItems() {
            sut.delete(identifier: activity.identifier)
        }
    }

    func test_getTodaysActivities_returnsActivityModelArray() {
        // When
        let activities = sut.getTodaysActivities()

        // Then
        XCTAssertEqual(activities.count, 10)
    }

    func test_getWeekday_today_returnsTodayWeekday() {
        // Given
        let dias = ["Domingo", "Segunda", "Terça", "Quarta", "Quinta", "Sexta", "Sábado"]
        let today = Date()
        let calendar = Calendar.current

        // When
        let weekday = sut.getWeekday(date: today)

        // Then
        XCTAssertEqual(weekday, dias[calendar.component(.weekday, from: today) - 1])
    }

    override func tearDown() {
        removeAllActivities()
        activitiesCreated = []
        sut = nil
    }
}
