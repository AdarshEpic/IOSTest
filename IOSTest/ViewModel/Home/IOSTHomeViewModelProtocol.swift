//
//  IOSTHomeViewModelProtocol.swift
//  IOSTest
//
//  Created by Adarsh Manoharan on 20/04/2 R.
//  Copyright © 2 Adarsh Manoharan. All rights reserved.
//

import Foundation
protocol IOSTHomeViewModelProtocols {
    var didSetNavigationTitle: ((_ title: String) -> Void)? { get set }
}
