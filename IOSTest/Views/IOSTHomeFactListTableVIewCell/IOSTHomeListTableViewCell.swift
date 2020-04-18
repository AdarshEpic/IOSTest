//
//  IOSTHomeListTableViewCell.swift
//  IOSTest
//
//  Created by Adarsh Manoharan on 17/04/2 R.
//  Copyright © 2 Adarsh Manoharan. All rights reserved.
//

import UIKit
import Masonry

protocol IOSTHomeListCellViewProtocols {
    var updateLayoutDelegate: IOSTHomeCellLayoutUpdateProtocol? { get }
}

final class IOSTHomeListTableViewCell: IOSTGenericTableViewCell<FactsList>, IOSTHomeListCellViewProtocols {
    //load view protocol
    weak var updateLayoutDelegate: IOSTHomeCellLayoutUpdateProtocol?
    var featureImageViewHeightConstraint: MASConstraint?
    //data setup
    override func setViewData() {
        self.featureTitleLabel.text = self.value?.title
        if let imageString = value?.imageHref {
            self.changeHeightOfImageView(height: 0)
            self.featureImageView.loadImage(with: imageString, completion: { (image) in
                guard let loadedImage = image else {
                    self.changeHeightOfImageView(height: 0)
                    self.featureImageView.sd_cancelCurrentImageLoad()
                    return
                }
                self.changeHeightOfImageView(height: self.getCalculatedHeight(image: loadedImage))
            })
        } else {
            self.changeHeightOfImageView(height: 0)
            self.featureImageView.sd_cancelCurrentImageLoad()
        }
        self.featureDescriptionLabel.text = value?.rowDescription
    }
    
    private func changeHeightOfImageView(height: CGFloat) {
        self.featureImageViewHeightConstraint?.equalTo()(height)
        self.updateLayoutDelegate?.updateCell(cell: self)
    }
    
    //calculating height server image
    private func getCalculatedHeight(image: UIImage) -> CGFloat {
        let aspectRatio = image.size.width/image.size.height
        let requiredHeight = (UIScreen.main.bounds.width - 40)/aspectRatio
        print(requiredHeight)
        return requiredHeight
    }
    // title label
    private lazy var featureTitleLabel: UILabel = {
        let lbl = UILabel()
        lbl.numberOfLines = 0
        lbl.isAccessibilityElement = true
        lbl.accessibilityIdentifier = "factTitle"
        lbl.font = UIFont.boldSystemFont(ofSize: 18)
        return lbl
    }()
    // image view
    private lazy var featureImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 5
        imageView.isAccessibilityElement = true
        imageView.accessibilityIdentifier = "factImageView"
        imageView.clipsToBounds = true
        return imageView
    }()
    // description label
    private lazy var featureDescriptionLabel: UILabel = {
        let lbl = UILabel()
        lbl.numberOfLines = 0
        lbl.isAccessibilityElement = true
        lbl.accessibilityIdentifier = "factDescription"
        lbl.font = UIFont().withSize(14)
        return lbl
    }()
    // initialization
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: reuseIdentifier)
        self.selectionStyle = .none
        self.setupView() // initilal setup
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
// MARK: Layout Setup
extension IOSTHomeListTableViewCell {
    // MARK: Setup View
    private func setupView() {
        self.addSubview(featureTitleLabel)
        self.addSubview(featureImageView)
        self.addSubview(featureDescriptionLabel)
        setupLayout() // add constraints
    }
    //layout setup
    private func setupLayout() {
        // Title label constraint setup
        MasonryHelper.addConstraint(parentView: self, view: self.featureTitleLabel, toViews:
            [.left, .right, .top], leftRightPadding: 20, topBottomPadding: 8)
        // ImageView label constraint setup
        MasonryHelper.addConstraint(parentView: self, view: self.featureImageView, toViews:
            [.left, .right], leftRightPadding: 20)
        MasonryHelper.addConstraint(parentView: self.featureTitleLabel, view: self.featureImageView, toViews:
            [.bottomToTop], topBottomPadding: 3)
        self.featureImageView.mas_makeConstraints { (make) in
            self.featureImageViewHeightConstraint = make?.height.equalTo()(0)
        }
        // Description label constraint setup
        MasonryHelper.addConstraint(parentView: self.featureImageView, view: self.featureDescriptionLabel, toViews:
            [.bottomToTop], topBottomPadding: 5)
        MasonryHelper.addConstraint(parentView: self, view: self.featureDescriptionLabel, toViews:
            [.left, .right, .bottom], leftRightPadding: 20, topBottomPadding: 8)
        
    }
}
