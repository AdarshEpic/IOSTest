//
//  IOSTHomeViewController.swift
//  IOSTest
//
//  Created by Adarsh Manoharan on 17/04/2 R.
//  Copyright © 2 Adarsh Manoharan. All rights reserved.
//

import UIKit
import Masonry
import KSToastView

class IOSTHomeViewController: UIViewController {
    // properties
    internal var contanerView: UIView!
    internal var factsListViewController: IOSTFactsListTableViewController!
    var viewModel: IOSTHomeViewModelProtocols!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        self.setupViewModel()
        setupView()
    }
    private func setupViewModel() {
        self.viewModel = IOSTHomeViewModel()
        self.viewModel.didSetNavigationTitle = { title in
            self.navigationItem.title = title
        }
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
        MasonryHelper.addConstraint(parentView: self .view, view: contanerView,
                                    toViews: [.bottomMargin, .topMargin, .right, .left])
        contanerView.backgroundColor = .red
        self.factsListViewController = IOSTFactsListTableViewController()
        self.factsListViewController.viewModel.didSetNavigationTitle = self.viewModel.didSetNavigationTitle
        self.addChild(self.factsListViewController)
        self.contanerView.addSubview(self.factsListViewController.view)
        MasonryHelper.addConstraint(parentView: contanerView,
                                    view: self.factsListViewController.view, toViews: [.top, .bottom, .right, .left])
    }
}
