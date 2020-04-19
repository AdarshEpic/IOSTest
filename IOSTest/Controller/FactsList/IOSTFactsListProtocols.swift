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
// should be available this. this does the updates over layouts, facts tableviewcell
protocol IOSTHomeListCellViewProtocols {
    var updateLayoutDelegate: IOSTHomeCellLayoutUpdateProtocol? { get }
}

//IOSFactView Protocol
protocol IOSFactsTableViewProtocols {
    var didSetTitle: ((_ title: String) -> Void)? { get set }
    var viewModel: IOSTFactsViewModelProtocol! { get }
}
