//
//  IOSTHomeViewController.swift
//  IOSTest
//
//  Created by Adarsh Manoharan on 17/04/2 R.
//  Copyright © 2 Adarsh Manoharan. All rights reserved.
//

import UIKit
import Masonry

protocol IOSTHomeViewControllerProtocol {
    
}

class IOSTHomeViewController: UIViewController {
    
    private var contanerView: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        setupView()

    }
    
    private func setupView() {
        self.contanerView = UIView()
        self.view.addSubview(contanerView)
        contanerView?.mas_makeConstraints({ (make) in
            make?.top.equalTo()(view.mas_topMargin)?.with().offset()(0)
            make?.left.equalTo()(view.mas_left)?.with().offset()(0)
            make?.right.equalTo()(view.mas_right)?.with().offset()(0)
            make?.bottom.equalTo()(view.mas_bottom)?.with().offset()(0)
            return()
        })
        contanerView.backgroundColor = .red
        
    }
    
}
// MARK: Initial Setup Fragment
extension IOSTHomeViewController {
    
}
