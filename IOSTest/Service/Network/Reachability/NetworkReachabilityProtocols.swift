//
//  ReachabilityProtocols.swift
//  IOSTest
//
//  Created by Adarsh Manoharan on 17/04/2 R.
//  Copyright © 2 Adarsh Manoharan. All rights reserved.
//

import Foundation
import Reachability

protocol NetworkReachabilityProtocol {
    var reachability: Reachability! {get set}
    static func isReachable(completed: @escaping (Bool) -> Void)
}
