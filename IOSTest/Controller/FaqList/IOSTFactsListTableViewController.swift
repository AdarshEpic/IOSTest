//
//  IOSTFactsListTableViewController.swift
//  IOSTest
//
//  Created by Adarsh Manoharan on 17/04/2 R.
//  Copyright © 2 Adarsh Manoharan. All rights reserved.
//

import UIKit

final class IOSTFactsListTableViewController: IOSTGenericTableViewController<FactsModel, IOSTHomeListTableViewCell>,
                                        IOSFactsTableViewProtocols {
    // ui model
    internal var factItems: [FactsModel] = [] {
        didSet {
            self.items = factItems
        }
    }
    
    var didSetTitle: ((_ title: String) -> Void)? // title setup listener
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.addRefreshController() // adding refresh controller
    }
    // from parent class: refreshing task
    override func refreshData(_ sender: UIRefreshControl) {
        print("refreshing data")
        self.refreshControl?.endRefreshing()
        self.tableView.reloadData()
    }
    // from parent class: configure cell when its created
    override func configureAtCellLoading(cell: IOSTHomeListTableViewCell) {
        cell.updateLayoutDelegate = self
    }
    // this will be triggered when orientation is taking place
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        let animationHandler: ((UIViewControllerTransitionCoordinatorContext) -> Void) = { _ in
            // This block will be called several times during rotation,
            // so if you want your tableView change more smooth reload it here too.
        }
        let completionHandler: ((UIViewControllerTransitionCoordinatorContext) -> Void) = { [weak self] (context) in
            // This block will be called when rotation will be completed
            self?.tableView.reloadData()
        }
        coordinator.animate(alongsideTransition: animationHandler, completion: completionHandler)
    }
}
// MARK: Update after loading image
extension IOSTFactsListTableViewController: IOSTHomeCellLayoutUpdateProtocol {
    func updateCell(cell: IOSTHomeListTableViewCell) {
        self.tableView.beginUpdates()
        if let indexPath = tableView.indexPath(for: cell) {
            self.tableView.reloadRows(at: [indexPath], with: .fade)
        }
        self.tableView.endUpdates()
    }
}
