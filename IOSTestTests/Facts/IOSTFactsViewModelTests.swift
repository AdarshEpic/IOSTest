//
//  IOSTFactViewModelTest.swift
//  IOSTestTests
//
//  Created by Adarsh Manoharan on 18/04/2 R.
//  Copyright © 2 Adarsh Manoharan. All rights reserved.
//

import XCTest
@testable import IOSTest

class IOSTFactViewModelTest: XCTestCase {
    var viewModel: IOSTFactsViewModelProtocol!
    var factServiceMock: FactServiceMock!
    var factDataSouce: IOSTFactViewModelDataSourceMock!
    override func setUp() {
        super.setUp()
        self.viewModel = IOSTFactsViewModel()
        self.factServiceMock = FactServiceMock()
        self.factDataSouce = IOSTFactViewModelDataSourceMock()
    }
    override func tearDown() {
        super.tearDown()
        self.viewModel = nil
        self.factServiceMock = nil
        self.factDataSouce = nil
    }
    func testViewModelMethods() {
        //error
        factServiceMock.request { (status, response) in
            XCTAssertTrue(status == APIResultStatus.success, "expected status success")
            let res = response as? FactsModel
            self.factDataSouce.didReceivedData(response: res, message: nil)
            XCTAssertNotNil(self.factDataSouce.response, "expected response")
        }
        factServiceMock.shouldReturnError = true //no error
        factServiceMock.request { (status, response) in
            XCTAssertNil(response, "response not nil")
            XCTAssertTrue(status == APIResultStatus.failure, "expected status success")
        }
    }

}
