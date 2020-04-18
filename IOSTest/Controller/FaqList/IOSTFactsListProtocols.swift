//
//  IOSTFactsListProtocols.swift
//  IOSTest
//
//  Created by Adarsh Manoharan on 17/04/2 R.
//  Copyright © 2 Adarsh Manoharan. All rights reserved.
//

import Foundation
//IOSHomeCell Protocol
protocol IOSTHomeCellLayoutUpdateProtocol: class {
    func updateCell(cell: IOSTHomeListTableViewCell)
}

//IOSFactView Protocol
protocol IOSFactsTableViewProtocols {
    var factItems: [FactsModel] { get set }
    var didSetTitle: ((_ title: String) -> Void)? { get set }
}
