//
//  UIView + Constranies.swift
//
//  Created by Dalia Hosny on 4/22/20.
//  Copyright © 2020 Dalia Hosny. All rights reserved.
//
import UIKit

extension UIView {

var heightConstaint: NSLayoutConstraint? {
    get {
        return constraints.first(where: {
            $0.firstAttribute == .height && $0.relation == .equal
        })
    }
    set { setNeedsLayout() }
}

var widthConstaint: NSLayoutConstraint? {
    get {
        return constraints.first(where: {
            $0.firstAttribute == .width && $0.relation == .equal
        })
    }
    set { setNeedsLayout() }
}

}
