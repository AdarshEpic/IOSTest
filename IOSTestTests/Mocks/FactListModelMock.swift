//
//  FactListModelMock.swift
//  IOSTestTests
//
//  Created by Adarsh Manoharan on 19/04/2 R.
//  Copyright © 2 Adarsh Manoharan. All rights reserved.
//

import Foundation
@testable import IOSTest

final class FactListModelMock {
    
    static func getDummyData() -> FactsModel {
        let row1: FactsList =
            FactsList(title: "Beavers",
                      rowDescription: "Beavers are second only to humans in their ability to manipulate.",
                      imageHref: "http://images.findicons.com/files/icons/662/world_flag/128/flag_of_canada.png")
        
        let row2: FactsList =
            FactsList(title: "Flag",
                      rowDescription: nil,
                      imageHref: "http://images.findicons.com/files/icons/662/world_flag/128/flag_of_canada.png")
        
        return FactsModel(viewTitle: "About Canada", listData: [row1, row2])
    }
}
