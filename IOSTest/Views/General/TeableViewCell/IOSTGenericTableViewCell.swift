//
//  IOSTGenericTableViewCell.swift
//  IOSTest
//
//  Created by Adarsh Manoharan on 18/04/2 R.
//  Copyright © 2 Adarsh Manoharan. All rights reserved.
//

import UIKit

class IOSTGenericTableViewCell<T>: UITableViewCell {
    
    var value: T? {
        didSet {
            setViewData()
        }
    }
    
    open func setViewData() {
        
    }

}
