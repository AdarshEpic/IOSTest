//
//  IOSTFactViewModelMock.swift
//  IOSTestTests
//
//  Created by Adarsh Manoharan on 19/04/2 R.
//  Copyright © 2 Adarsh Manoharan. All rights reserved.
//

import Foundation

@testable import IOSTest

final class IOSTFactsViewModelMock: IOSTFactsViewModelProtocol {
    
    var datasource: IOSTFactsViewModelDataSource?
    
    init() {
        self.initiateRequest()
    }
    
    var shouldReturnError = false
    var numberOfTimesCalled = 0
    
    func initiateRequest() {
        numberOfTimesCalled += 1
        if shouldReturnError {
            datasource?.didReceivedData(response: FactListModelMock.getDummyData(), message: nil)
        } else {
            datasource?.didReceivedData(response: nil, message: "Error")
        }
    }
    func numberOfTimesCalledInitializeRequest() -> Int {
        return numberOfTimesCalled
    }
}
