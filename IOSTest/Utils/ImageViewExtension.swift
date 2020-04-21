//
//  ImageViewExtension.swift
//  IOSTest
//
//  Created by Adarsh Manoharan on 17/04/2 R.
//  Copyright © 2 Adarsh Manoharan. All rights reserved.
//

import UIKit
import Kingfisher

extension UIImageView {
    //load from url
    func loadImage(`with` urlString: String, completion: @escaping(UIImage?) -> Void) {
        guard let url = URL.init(string: urlString) else {return}
        self.kf.setImage(with: url) { result in
            switch result {
            case .success(let value):
                completion(value.image)
            case .failure(let error):
                print(error)
                self.kf.cancelDownloadTask()
                return
            }
        }
    }
}
