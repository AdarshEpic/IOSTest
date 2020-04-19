//
//  IOSTFactsViewModel.swift
//  IOSTest
//
//  Created by Adarsh Manoharan on 18/04/2 R.
//  Copyright © 2 Adarsh Manoharan. All rights reserved.
//

import Foundation

class IOSTFactsViewModel: NSObject, IOSTFactsViewModelProtocol {
    
    public weak var datasource: IOSTFactsViewModelDataSource?
    
    override init() {
        super.init()
        self.initiateRequest()
    }
    
    public func initiateRequest() {
     
        FactsService().request { [weak self] (status, response) in
            guard let strongSelf = self else { return }
            
            switch status {
            case .success:
                guard let factModel = response as? FactsModel else { return }
                strongSelf.datasource?.didReceivedData(response: factModel,
                                                       message: NSLocalizedString("loadingContents", comment: ""))
            case .failure, .none, .some(.networkIssue):
                guard let error = response as? String else { return }
                strongSelf.datasource?.didReceivedData(response: nil, message: error)
            }
        }
    }
}
