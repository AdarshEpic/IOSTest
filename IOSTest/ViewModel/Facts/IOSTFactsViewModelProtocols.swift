//
//  IOSTFactsViewModelProtocol.swift
//  IOSTest
//
//  Created by Adarsh Manoharan on 18/04/2 R.
//  Copyright © 2 Adarsh Manoharan. All rights reserved.
//

import Foundation

protocol IOSTFactsViewModelProtocol: class {
    var didSetNavigationTitle: ((_ title: String) -> Void)? { get set }
    var datasource: IOSTFactsViewModelDataSource? { get set }
    func initiateRequest()
}

protocol IOSTFactsViewModelDataSource: class {
    func didReceivedData(response: FactsModel?, message: String?)
}
