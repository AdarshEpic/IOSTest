//
//  FactsServiceProtocol.swift
//  IOSTest
//
//  Created by Adarsh Manoharan on 18/04/2 R.
//  Copyright © 2 Adarsh Manoharan. All rights reserved.
//

import Foundation

protocol FactsServiceProtocol {
    func request(completion: @escaping (APIResultStatus?, Any?) -> Void)
}
