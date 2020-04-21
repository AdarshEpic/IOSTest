//
//  MasonryHelper.swift
//  IOSTest
//
//  Created by Adarsh Manoharan on 17/04/2 R.
//  Copyright © 2 Adarsh Manoharan. All rights reserved.
//

import UIKit
import Masonry

class MasonryHelper {
    // MARK: Constraint with parent view
    static func addConstraint(parentView: UIView, view: UIView,
                              toViews: [ViewConstraints], left: CGFloat = 0, right: CGFloat = 0, top: CGFloat = 0,
                              bottom: CGFloat = 0, center: CGFloat = 0) {
        let padding = UIEdgeInsets(top: top, left: left,
                                   bottom: bottom, right: right)
        view.mas_makeConstraints { (make) in
            toViews.forEach { (viewConstraints) in
                switch viewConstraints {
                case .left:
                    make?.left.equalTo()(parentView.mas_left)?.with().offset()(padding.left)
                case .right:
                    make?.right.equalTo()(parentView.mas_right)?.with().offset()(padding.right)
                case .top:
                    make?.top.equalTo()(parentView.mas_top)?.with().offset()(padding.top)
                case .bottom:
                    make?.bottom.equalTo()(parentView.mas_bottom)?.with().offset()(padding.bottom)
                case .leftMargin:
                    make?.leftMargin.equalTo()(parentView.mas_left)?.with()?.offset()(padding.left)
                case .topMargin:
                    make?.top.equalTo()(parentView.mas_topMargin)?.with()?.offset()(padding.top)
                case .bottomMargin:
                    make?.bottom.equalTo()(parentView.mas_bottomMargin)?.with()?.offset()(padding.bottom)
                case .rightMargin:
                    make?.rightMargin.equalTo()(parentView.mas_right)?.with()?.offset()(padding.right)
                case .bottomToTop:
                    make?.top.equalTo()(parentView.mas_bottom)?.with()?.offset()(padding.top)
                case .rightToLeft:
                    make?.right.equalTo()(parentView.mas_left)?.with()?.offset()(padding.right)
                }
            }
        }
    }
    func makeConstrain(parentView: UIView, view: UIView, padding: CGFloat) {
        let padding = UIEdgeInsets(top: padding, left: padding, bottom: padding, right: padding)
        view.mas_makeConstraints { (make) in
            make?.edges.equalTo()(parentView)?.with()?.insets()(padding)
        }
    }
    // MARK: Dimension for the view
    static func addDimensions(view: UIView, toViews: [ViewDimensions], height: CGFloat = 0, width: CGFloat = 0) {
        view.mas_makeConstraints { (make) in
            toViews.forEach { (viewConstraints) in
                switch viewConstraints {
                case .height:
                    make?.height.equalTo()(height)
                case .width:
                    make?.height.equalTo()(width)
                }
            }
        }
    }
    // MARK: Dimension for the view
    static func makeCenterTo(parentView: UIView, view: UIView, toViews: [ViewCenter], padding: CGFloat = 0) {
        view.mas_makeConstraints { (make) in
            toViews.forEach { (viewConstraints) in
                switch viewConstraints {
                case .centerlHorizondal:
                    make?.center.equalTo()(parentView.mas_centerX)?.with()?.offset()(padding)
                case .centerVertical:
                    make?.center.equalTo()(parentView.mas_centerY)?.with()?.offset()(padding)
                }
            }
        }
    }
}
enum ViewConstraints {
    case left
    case right
    case top
    case bottom
    case leftMargin
    case topMargin
    case bottomMargin
    case rightMargin
    case bottomToTop
    case rightToLeft
}
enum ViewDimensions {
    case height
    case width
}
enum ViewCenter {
    case centerlHorizondal
    case centerVertical
}
