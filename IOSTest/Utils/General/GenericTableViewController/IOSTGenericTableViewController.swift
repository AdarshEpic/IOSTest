//
//  IOSTGenericTableViewController.swift
//  IOSTest
//
//  Created by Adarsh Manoharan on 18/04/2 R.
//  Copyright © 2 Adarsh Manoharan. All rights reserved.
//

/* Method and functionalities can be implimented here for the tableview
   if need to change any method just override in your subclass
    update anything while pull to refresh override the refreshData
 */

import UIKit

class IOSTGenericTableViewController<T, Cell: IOSTGenericTableViewCell<T>>: UITableViewController {
    var items = [T]()
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    init() {
        super.init(style: .plain)
        self.tableView.register(Cell.self, forCellReuseIdentifier: String(describing: Cell.self))
        self.tableView.rowHeight = UITableView.automaticDimension
        self.tableView.estimatedRowHeight = 500
        self.tableView.separatorStyle = .none
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    //add if pull to refreash is required in your subclass
    public final func addRefreshController() {
        self.refreshControl = UIRefreshControl()
        if let refreshControl = self.refreshControl {
            refreshControl.addTarget(self, action: #selector(self.refreshData(_:)), for: .valueChanged)
            self.tableView.addSubview(refreshControl)
        }
    }
    // MARK: Override this function to data refresh in sublclass
    @objc open func refreshData(_ sender: UIRefreshControl) {
        self.refreshControl?.endRefreshing()
    }
    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return items.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: Cell.self),
                                                    for: indexPath) as? Cell {
            self.configureAtCellLoading(cell: cell, indexPath: indexPath)
            cell.value = items[indexPath.row]
            return cell
        }
        return UITableViewCell()
    }
    /// Only Override when there is anything need to configure while setting up the cell
    open func configureAtCellLoading(cell: Cell, indexPath: IndexPath) {}
    // Override this function when its needed
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    // Override this function only when its needed
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    override func tableView(_ tableView: UITableView,
                            willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {}
}
