//
//  Environment.swift
//  IOSTest
//
//  Created by Adarsh Manoharan on 17/04/2 R.
//  Copyright © 2 Adarsh Manoharan. All rights reserved.
//

import Foundation

public enum Environment {
    // MARK: - Keys
    enum Plist {
        static let rootURL = "ROOT_URL"
        static let apiKey = "API_KEY"
    }
    
    // MARK: - Plist
    private static let infoDictionary: [String: Any] = {
        guard let dict = Bundle.main.infoDictionary else {
            fatalError("Plist file not found")
        }
        return dict
    }()
    
    // MARK: - Plist values
    static let rootURL: String = {
        guard let rootURLstring = Environment.infoDictionary[Plist.rootURL] as? String else {
            fatalError("Root URL not set in plist for this environment")
        }
        return rootURLstring
    }()
    
    static let apiKey: String = {
        guard let apiKey = Environment.infoDictionary[Plist.apiKey] as? String else {
            fatalError("API Key not set in plist for this environment")
        }
        return apiKey
    }()
}
