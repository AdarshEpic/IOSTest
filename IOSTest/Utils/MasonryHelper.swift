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
                              toViews: [ViewConstraints], leftRightPadding: CGFloat = 0,
                              topBottomPadding: CGFloat = 0, centerPadding: CGFloat = 0) {
        view.mas_makeConstraints { (make) in
            toViews.forEach { (viewConstraints) in
                switch viewConstraints {
                case .left:
                    make?.left.equalTo()(parentView.mas_left)?.with().offset()(leftRightPadding)
                case .right:
                    make?.right.equalTo()(parentView.mas_right)?.with().offset()(-leftRightPadding)
                case .top:
                    make?.top.equalTo()(parentView.mas_top)?.with().offset()(topBottomPadding)
                case .bottom:
                    make?.bottom.equalTo()(parentView.mas_bottom)?.with().offset()(-topBottomPadding)
                case .leftMargin:
                    make?.left.equalTo()(parentView.mas_leftMargin)?.with()?.offset()(leftRightPadding)
                case .topMargin:
                    make?.top.equalTo()(parentView.mas_topMargin)?.with()?.offset()(topBottomPadding)
                case .bottomMargin:
                    make?.bottom.equalTo()(parentView.mas_bottomMargin)?.with()?.offset()(-topBottomPadding)
                case .rightMargin:
                    make?.right.equalTo()(parentView.mas_rightMargin)?.with()?.offset()(-leftRightPadding)
                case .bottomToTop:
                    make?.top.equalTo()(parentView.mas_bottom)?.with()?.offset()(topBottomPadding)
                }
                
            }
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
}
enum ViewDimensions {
    case height
    case width
}
enum ViewCenter {
     case centerlHorizondal
    case centerVertical
}
