//
//  IOSTFactsListTableViewControllerTests.swift
//  IOSTestUITests
//
//  Created by Adarsh Manoharan on 18/04/2 R.
//  Copyright © 2 Adarsh Manoharan. All rights reserved.
//

import XCTest
import Foundation

@testable import IOSTest

class IOSTFactsListTableViewControllerTests: XCTestCase {
    private var app: XCUIApplication!
    override func setUp() {
        continueAfterFailure = false
        app = XCUIApplication()
        app.launch()
    }
    func testForCellExistence() {
        let detailstable = app.tables.matching(identifier: "factTableView")
        let firstCell = detailstable.cells.element(matching: .cell, identifier: "factTVC_0_0")
        let existencePredicate = NSPredicate(format: "exists == 1")
        let expectationEval = expectation(for: existencePredicate, evaluatedWith: firstCell, handler: nil)
        let mobWaiter = XCTWaiter.wait(for: [expectationEval], timeout: 10.0)
        XCTAssert(XCTWaiter.Result.completed == mobWaiter, "Test Case Failed.")
    }
    func testForCellSelection() {
        let detailstable = app.tables.matching(identifier: "factTableView")
        let firstCell = detailstable.cells.element(matching: .cell, identifier: "factTVC_0_0")
        let predicate = NSPredicate(format: "isHittable == true")
        let expectationEval = expectation(for: predicate, evaluatedWith: firstCell, handler: nil)
        let waiter = XCTWaiter.wait(for: [expectationEval], timeout: 10.0)
        XCTAssert(XCTWaiter.Result.completed == waiter, "Test Case Failed.")
        firstCell.tap()
    }
    func testLabelExistenceOnTable() {
        let detailstable = app.tables.matching(identifier: "factTableView")
        let firstCell = detailstable.cells.element(matching: .cell, identifier: "factTVC_0_0")
        XCTAssertTrue(firstCell.exists, "Table view cell not exist.")
        let factTitleLabel = firstCell.staticTexts["factTitle"]
        XCTAssertTrue(factTitleLabel.exists, "Key label not exist.")
        let factDescriptionLabel = firstCell.staticTexts["factDescription"]
        XCTAssertTrue(factDescriptionLabel.exists, "Value label not exist.")
        let factImageView = firstCell.images["factImageView"]
        XCTAssertTrue(factImageView.exists, "imageView not exist.")
    }
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    func testExample() {
        print("UITest")
    }
}
