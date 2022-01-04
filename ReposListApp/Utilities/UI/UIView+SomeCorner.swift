//
//  UIView+SomeCorner.swift
//  InstaScene
//
//  Created by Ebrahim Attalla on 5/1/21.
//

import UIKit
extension UIView {
    
    /*
     
     // Call the roundCorners() func right there.
     theView.roundCorners(corners: [.topLeft, .topRight], radius: 30)
     
     */
    
    func roundCorners(corners: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        layer.mask = mask
    }
}
