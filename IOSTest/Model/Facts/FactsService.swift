//
//  FactsService.swift
//  IOSTest
//
//  Created by Adarsh Manoharan on 18/04/2 R.
//  Copyright © 2 Adarsh Manoharan. All rights reserved.
//

import Foundation

final class FactsService: NetworkManager <FactsModel> {
    func request(completion: @escaping RequestCompletion) {
        requestUrl = ApiPath.facts
        requestMethod = .get
        formatterRequired = true
        super.perform(params: EmptyRequest(), completion: completion)
    }
}
