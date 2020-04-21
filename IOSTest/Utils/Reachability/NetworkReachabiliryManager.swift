//
//  NetworkReachabiliryManager.swift
//  IOSTest
//
//  Created by Adarsh Manoharan on 17/04/2 R.
//  Copyright © 2 Adarsh Manoharan. All rights reserved.
//

import Foundation
import Reachability

class NetworkReachabilityManager: NSObject {
    var reachability: Reachability!
    private static let shared: NetworkReachabilityManager = { return NetworkReachabilityManager() }()
    override init() {
        super.init()
        do {
            reachability = try Reachability()
        } catch let err {
            print(err.localizedDescription)
        }
    }
    static func isReachable(completed: @escaping (Bool) -> Void) {
        if (NetworkReachabilityManager.shared.reachability).connection != .unavailable {
            completed(true)
        } else {
            completed(false)
        }
    }
}
