//
//  IOSTFactsViewModel.swift
//  IOSTest
//
//  Created by Adarsh Manoharan on 18/04/2 R.
//  Copyright © 2 Adarsh Manoharan. All rights reserved.
//

import Foundation

class IOSTFactsViewModel: NSObject, IOSTFactsViewModelProtocol {
    var didSetNavigationTitle: ((String) -> Void)?
    public weak var datasource: IOSTFactsViewModelDataSource?
    //initlal setup
    override init() {
        super.init()
    }
    public func initiateRequest() {
        FactsService().request { [weak self] (status, response) in
            guard let strongSelf = self else { return }
            switch status {
            case .success:
                guard let factModel = response as? FactsModel else { return }
                strongSelf.datasource?.didReceivedData(response: factModel,
                                                       message: NSLocalizedString("loadingContents", comment: ""))
                strongSelf.didSetNavigationTitle?(factModel.viewTitle ?? "")
            case .failure, .none, .some(.networkIssue):
                guard let error = response as? String else { return }
                strongSelf.datasource?.didReceivedData(response: nil, message: error)
                strongSelf.didSetNavigationTitle?(error)
            }
        }
    }
}
