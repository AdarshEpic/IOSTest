//
//  IOSTHomeListTableViewCell.swift
//  IOSTest
//
//  Created by Adarsh Manoharan on 17/04/2 R.
//  Copyright © 2 Adarsh Manoharan. All rights reserved.
//

import UIKit
import Masonry
import Kingfisher

class IOSTHomeListTableViewCell: UITableViewCell {
    //load view protocol
    weak var updateLayoutDelegate: IOSTHomeCellLayoutUpdateProtocol?
    //data setup
    var dataFacts: FactsModel? {
        didSet {
            print("value recived")
            self.featureTitleLabel.text = dataFacts!.title! + "asdasdasdasdasdasdasdasdasd ad asd asd asd asd "
            self.featureImageView.downloadImage(with: dataFacts!.image!, completion: { (image) in
                guard let loadedImage = image else {
                    MasonryHelper.addDimensions(view: self.featureImageView, toViews: [.height], height: 0)
                    MasonryHelper.addConstraint(parentView: self.featureImageView,
                                                view: self.featureTitleLabel, toViews: [.bottomToTop])
                    self.updateLayoutDelegate?.updateCell(cell: self)
                    return
                }
                self.featureImageView.image = image
                MasonryHelper.addDimensions(view: self.featureImageView,
                                            toViews: [.height], height: self.getCalculatedHeight(image: loadedImage))
                self.updateLayoutDelegate?.updateCell(cell: self)
            })
            self.featureDescriptionLabel.text = dataFacts?.description
            
        }
    }
    //calculating height server image
    func getCalculatedHeight(image: UIImage) -> CGFloat {
        let aspectRatio = image.size.width/image.size.height
        let requiredHeight = (UIScreen.main.bounds.width - 40)/aspectRatio
        return requiredHeight
    }
    // title label
    private lazy var featureTitleLabel: UILabel = {
        let lbl = UILabel()
        lbl.numberOfLines = 0
        lbl.backgroundColor = .red
        return lbl
    }()
    // image view
    private lazy var featureImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .green
        return imageView
    }()
    // description label
    private lazy var featureDescriptionLabel: UILabel = {
        let lbl = UILabel()
        lbl.numberOfLines = 0
        lbl.backgroundColor = .blue
        return lbl
    }()
    // initialization
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .subtitle, reuseIdentifier: nil)
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
            [.bottomToTop], topBottomPadding: 5)
        // Description label constraint setup
        MasonryHelper.addConstraint(parentView: self.featureImageView, view: self.featureDescriptionLabel, toViews:
            [.bottomToTop], topBottomPadding: 8)
        MasonryHelper.addConstraint(parentView: self, view: self.featureDescriptionLabel, toViews:
            [.left, .right, .bottom], leftRightPadding: 20, topBottomPadding: 8)
        
    }
}
