//
//  IOSTHomeListTableViewCell.swift
//  IOSTest
//
//  Created by Adarsh Manoharan on 17/04/2 R.
//  Copyright © 2 Adarsh Manoharan. All rights reserved.
//

import UIKit

protocol ConfigurableCell {
    associatedtype DataType
    func configure(data: DataType)
}

class IOSTHomeListTableViewCell: UITableViewCell {
    
    var dataFacts: FactsModel? {
        didSet {
            print("value recived")
        }
    }

    private lazy var featureTitleLabel: UILabel = {
       let lbl = UILabel()
       return lbl
    }()
    
    private lazy var featureImageView: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    private lazy var featuredescriptionLabe: UILabel = {
         let lbl = UILabel()
         return lbl
      }()

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
