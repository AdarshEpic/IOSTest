//
//  IOSTHomeListTableViewCell.swift
//  IOSTest
//
//  Created by Adarsh Manoharan on 17/04/2 R.
//  Copyright © 2 Adarsh Manoharan. All rights reserved.
//

import UIKit
import Masonry

final class IOSTHomeListTableViewCell: IOSTGenericTableViewCell<FactsList>, IOSTHomeListCellViewProtocols {
    //load view protocol
    weak var updateLayoutDelegate: IOSTHomeCellLayoutUpdateProtocol?
    var featureImageViewHeightConstraint: MASConstraint?
    var featureImageViewWidthConstraint: MASConstraint?
    var maxHeight: CGFloat = 250.0
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
        if requiredHeight > self.maxHeight {
             return maxHeight
        } else {
             return requiredHeight
        }
    }
    // view cmponents
    private lazy var featureTitleLabel: UILabel = {
        let lbl = UILabel()
        lbl.numberOfLines = 0
        lbl.isAccessibilityElement = true
        lbl.accessibilityIdentifier = "factTitle"
        lbl.backgroundColor = .white
        lbl.textAlignment = .center
        lbl.font = UIFont.boldSystemFont(ofSize: 25)
        return lbl
    }()
    private lazy var featureImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 8
        imageView.clipsToBounds = true
        imageView.isAccessibilityElement = true
        imageView.accessibilityIdentifier = "factImageView"
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        return imageView
    }()
    private lazy var featureDescriptionLabel: UILabel = {
        let lbl = UILabel()
        lbl.numberOfLines = 0
        lbl.isAccessibilityElement = true
        lbl.backgroundColor = .white
        lbl.accessibilityIdentifier = "factDescription"
        lbl.textAlignment = .center
        lbl.font = UIFont.systemFont(ofSize: 22)
        return lbl
    }()
    private lazy var contentBackgroundView: UIView = {
       let view = UIView()
        view.backgroundColor = UIColor.white
        view.layer.borderColor = UIColor.lightGray.cgColor
        view.layer.borderWidth = 0.8
        view.layer.cornerRadius = 8
        return view
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
        self.addSubview(contentBackgroundView)
        self.contentBackgroundView.addSubview(featureTitleLabel)
        self.contentBackgroundView.addSubview(featureImageView)
        self.contentBackgroundView.addSubview(featureDescriptionLabel)
        if UIDevice.current.userInterfaceIdiom == .pad {
            self.featureTitleLabel.font = UIFont.boldSystemFont(ofSize: 35)
            self.featureDescriptionLabel.font = UIFont.systemFont(ofSize: 30)
            self.maxHeight = 340
        }
        setupLayout()
    }
    //layout setup
    private func setupLayout() {
        MasonryHelper.addConstraint(parentView: self, view: contentBackgroundView, toViews:
            [.left, .right, .top, .bottom], left: 20, right: 0, top: 10, bottom: -20)
        MasonryHelper.addConstraint(parentView: self.contentBackgroundView, view: self.featureTitleLabel,
                                    toViews: [.top, .left, .right], left: 10, right: -10, top: 10)
        MasonryHelper.addConstraint(parentView: self.contentBackgroundView, view: self.featureImageView,
        toViews: [.left, .right], left: 10, right: -10)
        MasonryHelper.addConstraint(parentView: self.featureTitleLabel, view: self.featureImageView,
        toViews: [.bottomToTop], top: 10)

        self.featureImageView.mas_makeConstraints { (make) in
            self.featureImageViewHeightConstraint = make?.height.equalTo()(0)
        }
        MasonryHelper.addConstraint(parentView: self.contentBackgroundView,
                                    view: self.featureDescriptionLabel, toViews: [.left, .right], left: 10, right: -10)
        MasonryHelper.addConstraint(parentView: self.featureImageView,
                                           view: self.featureDescriptionLabel, toViews: [.bottomToTop], top: 10)
        MasonryHelper.addConstraint(parentView: self,
                                           view: self.featureDescriptionLabel, toViews: [.bottom], bottom: -30)
    }
}
