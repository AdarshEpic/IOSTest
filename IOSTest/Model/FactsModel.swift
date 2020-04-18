//
//  FactsModel.swift
//  IOSTest
//
//  Created by Adarsh Manoharan on 17/04/2 R.
//  Copyright © 2 Adarsh Manoharan. All rights reserved.
//

import Foundation

struct FactsModel: Decodable {
    var title: String?
    var image: String?
    var descriptionFeature: String?
    
    init(title: String?, image: String?, descriptionFeature: String) {
        self.title = title
        self.image = image
        self.descriptionFeature = descriptionFeature
    }
}
