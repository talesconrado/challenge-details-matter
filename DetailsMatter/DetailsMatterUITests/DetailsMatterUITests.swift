//
//  DetailsMatterUITests.swift
//  DetailsMatterUITests
//
//  Created by Tales Conrado on 14/09/20.
//  Copyright © 2020 Tales Conrado. All rights reserved.
//

import XCTest
@testable import DetailsMatter

class DetailsMatterUITests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state -
        // such as interface orientation
        // - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()
        let name = "fdsfdsfdsf"
        let element = app.children(matching: .window).element(boundBy: 0).children(matching: .other).element.children(matching: .other).element.children(matching: .other).element
        element.children(matching: .textField).element(boundBy: 0).tap()
        element.children(matching: .textField).element(boundBy: 1).tap()
        
        let textField = element.children(matching: .textField).element(boundBy: 2)
        textField.tap()
        textField.typeText(name)
        app/*@START_MENU_TOKEN@*/.staticTexts["Nova Vacina"]/*[[".buttons[\"Nova Vacina\"].staticTexts[\"Nova Vacina\"]",".staticTexts[\"Nova Vacina\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        element.children(matching: .collectionView).element(boundBy: 0).children(matching: .cell).element(boundBy: 2).otherElements.containing(.staticText, identifier:"Vacine").element.swipeLeft()
        
        let collectionView = element.children(matching: .collectionView).element(boundBy: 1)

        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTOSSignpostMetric.applicationLaunch]) {
                XCUIApplication().launch()
            }
        }
    }
}
