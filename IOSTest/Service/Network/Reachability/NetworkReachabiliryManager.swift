//
//  NetworkReachabiliryManager.swift
//  IOSTest
//
//  Created by Adarsh Manoharan on 17/04/2 R.
//  Copyright © 2 Adarsh Manoharan. All rights reserved.
//

import Foundation
import Reachability

class NetworkReachabilityManager: NSObject, NetworkReachabilityProtocol {
    
    var reachability: Reachability!
    private static let shared: NetworkReachabilityManager = { return NetworkReachabilityManager() }()
    
    override init() {
        super.init()
        do {
            reachability = try Reachability()
        } catch let err {
            print(err.localizedDescription)
        }
        /*This will notify globaly if network chaged
        / Broadcasting the network change
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(networkStatusChanged(_:)),
            name: .reachabilityChanged,
            object: reachability
        )
        
        do {
            try reachability.startNotifier()
        } catch {
            print("Unable to start notifier")
        }
         */
    }
    /*
    @objc func networkStatusChanged(_ notification: Notification) {
        // Do something globally here!
    }
    
    static func stopNotifier() -> Void {
        do {
            try (NetworkReachabilityManager.shared.reachability).startNotifier()
        } catch {
            print("Error stopping notifier")
        }
    }
    */
    static func isReachable(completed: @escaping (Bool) -> Void) {
        if (NetworkReachabilityManager.shared.reachability).connection != .unavailable {
            completed(true)
        } else {
            completed(false)
        }
    }
    /*
    static func isUnreachable(completed: @escaping (NetworkReachabilityManager) -> Void) {
        if (NetworkReachabilityManager.shared.reachability).connection == .unavailable {
            completed(NetworkReachabilityManager.shared)
        }
    }
    
    static func isReachableViaWWAN(completed: @escaping (NetworkReachabilityManager) -> Void) {
        if (NetworkReachabilityManager.shared.reachability).connection == .cellular {
            completed(NetworkReachabilityManager.shared)
        }
    }
    
    static func isReachableViaWiFi(completed: @escaping (NetworkReachabilityManager) -> Void) {
        if (NetworkReachabilityManager.shared.reachability).connection == .wifi {
            completed(NetworkReachabilityManager.shared)
        }
    } */
}
