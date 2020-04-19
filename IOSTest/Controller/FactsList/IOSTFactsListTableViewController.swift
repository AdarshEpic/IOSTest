//
//  IOSTFactsListTableViewController.swift
//  IOSTest
//
//  Created by Adarsh Manoharan on 17/04/2 R.
//  Copyright © 2 Adarsh Manoharan. All rights reserved.
//

import UIKit
import KSToastView

final class IOSTFactsListTableViewController: IOSTGenericTableViewController<FactsList, IOSTHomeListTableViewCell>,
                                        IOSFactsTableViewProtocols {
    // ui model
    internal var factItems: FactsModel? {
        didSet {
            guard let rows = factItems?.listData else { return }
            self.items = rows
        }
    }
    
    public var viewModel: IOSTFactsViewModelProtocol!
    
    var didSetTitle: ((_ title: String) -> Void)? // title setup listener
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.addRefreshController() // adding refresh controller
        self.prepareViewModel()
        self.setupView()
       
    }
    
    // from parent class: refreshing task
    override func refreshData(_ sender: UIRefreshControl) {
        print("refreshing data")
        self.refreshControl?.endRefreshing()
        viewModel.initiateRequest()
        self.tableView.reloadData()
        
    }
    
    private func setupView() {
        tableView.isAccessibilityElement = true
        tableView.accessibilityIdentifier = "factTableView"
        self.tableView.allowsSelection = false
    }
    
    private func prepareViewModel() {
        viewModel = IOSTFactsViewModel()
        viewModel.datasource = self
    }
    // from parent class: configure cell when its created
    override func configureAtCellLoading(cell: IOSTHomeListTableViewCell, indexPath: IndexPath) {
        cell.updateLayoutDelegate = self
        //testable
        cell.isAccessibilityElement = true
        cell.accessibilityIdentifier = String(format: "factTVC_%d_%d",
        indexPath.section, indexPath.row)
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
    
    override func tableView(_ tableView: UITableView,
                            willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.alpha = 0
        UIView.animate(withDuration: 0.4) {
            cell.alpha = 1.0
        }
    }
}
// MARK: Update after loading image
extension IOSTFactsListTableViewController: IOSTHomeCellLayoutUpdateProtocol {
    func updateCell(cell: IOSTHomeListTableViewCell) {
        if let indexPath = tableView.indexPath(for: cell) {
            self.tableView.reloadRows(at: [indexPath], with: .fade)
        }
    }
}
extension IOSTFactsListTableViewController: IOSTFactsViewModelDataSource {
    func didReceivedData(response: FactsModel?, message: String?) {
        KSToastView.ks_showToast(message)
        self.factItems = response
        self.didSetTitle?((response?.viewTitle)!)
        self.tableView.reloadData()
    }
    
}
