//
//  ActivityControllerTests.swift
//  DetailsMatterTests
//
//  Created by Tales Conrado on 24/09/20.
//  Copyright © 2020 Tales Conrado. All rights reserved.
//

import XCTest
@testable import DetailsMatter

class ActivityControllerTests: XCTestCase {
    var sut: ActivityController!

    override func setUp() {
        sut = ActivityController()
    }

    func test_titleLoaded_onAppear_isNovaAtividade() {
        //when
        sut.viewDidLoad()
        //then
        XCTAssertEqual(sut.title, "Nova Atividade")
    }

    func test_detailsViewDelegate_OnCategoryChange_isEqual() {
        let detailsView = DetailsView(size: 3, type: .categoryDetails)
        detailsView.delegate = sut

        //when
        detailsView.selectedOption = 1
        let selectedOnController = sut.selectedCategory

        //then
        XCTAssertEqual(detailsView.selectedOption, selectedOnController)
    }

    func test_detailsViewDelegate_OnRepeatChange_isEqual() {
        let detailsView = DetailsView(size: 3, type: .repeatDetails)
        detailsView.delegate = sut

        //when
        detailsView.selectedOption = 2
        let selectedOnController = sut.selectedRepeat

        //then
        XCTAssertEqual(detailsView.selectedOption, selectedOnController)
    }

    func test_saveActivity_OnTitleChange_isEqual() {

        sut.saveActivity()
    }

    override func tearDown() {
        sut = nil
    }
}
