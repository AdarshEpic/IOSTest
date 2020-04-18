//
//  IOSTFactsViewModel.swift
//  IOSTest
//
//  Created by Adarsh Manoharan on 18/04/2 R.
//  Copyright © 2 Adarsh Manoharan. All rights reserved.
//

protocol IOSTFactsViewModelProtocol {
    
}

protocol IOSTFactsViewModelDataSource: class {
    func didReceivedData(response: FactsModel?, message: String?)
}

import Foundation

class IOSTFactsViewModel: NSObject {
    
    private var factsService: FactsService!
    public weak var datasource: IOSTFactsViewModelDataSource?
    
    override init() {
        self.factsService = FactsService()
    }
    
    public func initiateRequest() {
        self.factsService.request { [weak self] (status, response) in
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
