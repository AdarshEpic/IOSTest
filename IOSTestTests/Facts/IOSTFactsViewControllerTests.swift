//
//  IOSTFactsViewControllerTests.swift
//  IOSTestTests
//
//  Created by Adarsh Manoharan on 19/04/2 R.
//  Copyright © 2 Adarsh Manoharan. All rights reserved.
//

import XCTest

@testable import IOSTest

class IOSTFactsViewControllerTests: XCTestCase {
    
    var viewModel: IOSTFactsViewModelMock!
    var sut: IOSTFactsListTableViewController!
    var factsDataSource: IOSTFactViewModelDataSourceMock!

    override func setUp() {
        super.setUp()
        self.sut = IOSTFactsListTableViewController()
        self.viewModel = IOSTFactsViewModelMock()
        sut.viewModel = self.viewModel
        self.factsDataSource = IOSTFactViewModelDataSourceMock()
        self.viewModel.datasource = self.factsDataSource
    }

    override func tearDown() {
        super.tearDown()
        sut = nil
        viewModel = nil
    }

    func testViewModelDataSourceThrowError() {
        viewModel.shouldReturnError = false // throw error
        viewModel.initiateRequest()
        XCTAssertTrue(self.factsDataSource.response == nil, self.factsDataSource.message ?? "")
  
        viewModel.shouldReturnError = true // success
        viewModel.initiateRequest()
        XCTAssertTrue(self.factsDataSource.response.flatMap({ (item) in
            sut.factItems = item
        }) != nil, self.factsDataSource.message ?? "")
        
        XCTAssertFalse(self.viewModel.numberOfTimesCalledInitializeRequest()
            != 3, "\(viewModel.numberOfTimesCalled) called the function")
    }

}
