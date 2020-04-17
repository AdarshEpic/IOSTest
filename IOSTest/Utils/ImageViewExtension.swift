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
    func loadImageFromUrl(string: String) {
        let url = URL(string: string)
        self.kf.setImage(with: url)
    }
    //download from url with completion
    func downloadImage(`with` urlString: String, completion: @escaping(UIImage?) -> Void) {
        guard let url = URL.init(string: urlString) else {
            return
        }
        let resource = ImageResource(downloadURL: url)

        KingfisherManager.shared.retrieveImage(with: resource, options: nil, progressBlock: nil) { result in
            switch result {
            case .success(let value):
                print("Image: \(value.image). Got from: \(value.cacheType)")
                completion(value.image)
            case .failure(let error):
                print("Error: \(error)")
                completion(nil)
            }
        }
    }
}
