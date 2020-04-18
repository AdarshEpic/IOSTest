//
//  ImageViewExtension.swift
//  IOSTest
//
//  Created by Adarsh Manoharan on 17/04/2 R.
//  Copyright © 2 Adarsh Manoharan. All rights reserved.
//

import UIKit
import SDWebImage

extension UIImageView {
    //load from url
    func loadImage(`with` urlString: String, completion: @escaping(UIImage?) -> Void) {
        guard let url = URL.init(string: urlString) else {
            return
        }        
        self.sd_setImage(with: url, placeholderImage: UIImage(named: "placeholder"),
                         options: SDWebImageOptions(rawValue: 0), completed: { image, error, _, _ in
                            guard error == nil else {
                                self.sd_cancelCurrentImageLoad()
                                print(error?.localizedDescription ?? "")
                                return
                            }
                            completion(image)
                            
        })
    }
}
