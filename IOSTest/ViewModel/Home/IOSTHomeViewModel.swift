//
//  IOSTHomeViewModel.swift
//  IOSTest
//
//  Created by Adarsh Manoharan on 20/04/2 R.
//  Copyright © 2 Adarsh Manoharan. All rights reserved.
//

import Foundation

class IOSTHomeViewModel: NSObject, IOSTHomeViewModelProtocols {
    public var didSetNavigationTitle: ((_ title: String) -> Void)?
}
extension IOSTHomeViewModel: SetNavigationBarTitleProtocol {
    func setNavigationTitle(tilteString: String) {
        self.didSetNavigationTitle?(tilteString)
    }
}
