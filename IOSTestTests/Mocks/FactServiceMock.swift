//
//  FactServiceMock.swift
//  IOSTestTests
//
//  Created by Adarsh Manoharan on 18/04/2 R.
//  Copyright © 2 Adarsh Manoharan. All rights reserved.
//

import Foundation

@testable import IOSTest

final class FactServiceMock: FactsServiceProtocol {
    
    var shouldReturnError = false
    var numberOfTimesGenerated = 0
    
    func request(completion: @escaping (_ error: APIResultStatus?, _ data: Any?) -> Void) {
        numberOfTimesGenerated += numberOfTimesGenerated
        guard !shouldReturnError else {
            completion(.failure, nil)
            return
        }
        completion(.success, FactListModelMock.getDummyData())
    }
    
    func numberOfTimesCalled() -> Int {
        return numberOfTimesGenerated
    }
}
