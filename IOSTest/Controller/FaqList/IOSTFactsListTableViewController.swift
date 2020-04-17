//
//  IOSTFactsListTableViewController.swift
//  IOSTest
//
//  Created by Adarsh Manoharan on 17/04/2 R.
//  Copyright © 2 Adarsh Manoharan. All rights reserved.
//

import UIKit

class IOSTFactsListTableViewController: UITableViewController {
    // ui model
    var items = [FactsModel]()
    
    var didSetTitle: ((_ title: String) -> Void)?
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not implimented")
    }
    
    init() {
        super.init(style: .plain)
        self.tableView.register(IOSTHomeListTableViewCell.self, forCellReuseIdentifier: "Cell")
        self.tableView.rowHeight = UITableView.automaticDimension
        self.tableView.estimatedRowHeight = 100
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
        if let cell = tableView.dequeueReusableCell(withIdentifier: "Cell",
                                                    for: indexPath) as? IOSTHomeListTableViewCell {
            cell.dataFacts = items[indexPath.row]
            cell.updateLayoutDelegate = self
            return cell
        }
        return UITableViewCell()
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
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
