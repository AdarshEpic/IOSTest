//
//  NetworkManagerProtocols.swift
//  IOSTest
//
//  Created by Adarsh Manoharan on 17/04/2 R.
//  Copyright © 2 Adarsh Manoharan. All rights reserved.
//

import Foundation

protocol NetworkManagerProtocol {
    associatedtype RequestCompletion = (_ error: APIResultStatus?, _ data: Any?) -> Void
    var requestMethod: HTTPMethod! { get set }
    var requestUrl: String! { get set }
    var formatterRequired: Bool { get set }
    func perform<M: Encodable>(params: M?, completion: RequestCompletion)
}
