//
//  FactsModel.swift
//  IOSTest
//
//  Created by Adarsh Manoharan on 17/04/2 R.
//  Copyright © 2 Adarsh Manoharan. All rights reserved.
//

import Foundation

struct FactsModel: Decodable {
    let viewTitle: String?
    let listData: [FactsList]?
    enum CodingKeys: String, CodingKey {
        case viewTitle = "title"
        case listData = "rows"
    }
}
// MARK: - FactsList
struct FactsList: Decodable {
    let title, rowDescription: String?
    let imageHref: String?
    enum CodingKeys: String, CodingKey {
        case title
        case rowDescription = "description"
        case imageHref
    }
}
