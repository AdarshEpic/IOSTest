//
//  IOSTHomeViewController.swift
//  IOSTest
//
//  Created by Adarsh Manoharan on 17/04/2 R.
//  Copyright © 2 Adarsh Manoharan. All rights reserved.
//

import UIKit
import Masonry

class IOSTHomeViewController: UIViewController {
    // properties
    private var contanerView: UIView!
    private var factsListViewController: IOSTFactsListTableViewController!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        setupView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationItem.title = ""
    }
    
}
// MARK: Initial Setup Fragment
extension IOSTHomeViewController {
    //initial setup
    private func setupView() {
        //setupContainer
        self.contanerView = UIView()
        self.view.addSubview(contanerView)
        MasonryHelper.addConstraint(parentView: self.view, view: contanerView,
                                    toViews: [.bottomMargin, .topMargin, .right, .left])
        contanerView.backgroundColor = .red
        //setupTableViewController
        self.factsListViewController = IOSTFactsListTableViewController()
        //set from child view controller
        self.factsListViewController.didSetTitle = {[weak self] title in
            self?.navigationItem.title = title // will trigger this when setting item from FactsListTVC
        }
        self.addChild(self.factsListViewController)
        self.contanerView.addSubview(self.factsListViewController.view)
        MasonryHelper.addConstraint(parentView: contanerView,
                                    view: self.factsListViewController.view, toViews: [.top, .bottom, .right, .left])
    }
    
}
