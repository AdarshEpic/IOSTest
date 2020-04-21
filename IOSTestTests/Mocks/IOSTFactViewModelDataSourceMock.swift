//
//  IOSTFactViewModelDataSourceMock.swift
//  IOSTestTests
//
//  Created by Adarsh Manoharan on 19/04/2 R.
//  Copyright © 2 Adarsh Manoharan. All rights reserved.
//

import Foundation

@testable import IOSTest

final class IOSTFactViewModelDataSourceMock: IOSTFactsViewModelDataSource {
    var response: FactsModel?
    var message: String?
    func didReceivedData(response: FactsModel?, message: String?) {
        self.response = response
    }
}
