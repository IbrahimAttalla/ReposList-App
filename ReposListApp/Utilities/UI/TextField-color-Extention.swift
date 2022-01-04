//
//  TextField-color-Extention.swift
//
//  Created by it thinkers on 3/23/20.
//  Copyright © 2020 Dalia Hosny. All rights reserved.
//

import UIKit

extension UITextField{
    @IBInspectable var placeHolderColor: UIColor? {
        get {
            return self.placeHolderColor
        }
        set {
            let paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.alignment = .center

            self.attributedPlaceholder = NSAttributedString(string:self.placeholder != nil ? self.placeholder! : "", attributes:[NSAttributedString.Key.foregroundColor: newValue!])
                   }
    }
    
    // [NSAttributedStringKey.paragraphStyle: paragraphStyle, NSAttributedStringKey.foregroundColor:color]
//    ,NSAttributedString.Key.paragraphStyle: paragraphStyle
   
    @IBInspectable var placeHolderAlignment: NSTextAlignment {
        get {
            return self.placeHolderAlignment
        }
        set {
            let paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.alignment = .center

            self.attributedPlaceholder = NSAttributedString(string:self.placeholder != nil ? self.placeholder! : "", attributes:[NSAttributedString.Key.paragraphStyle: paragraphStyle])
                   }
    }

}

extension UITextField {
    func setLeftPaddingPoints(_ amount:CGFloat){
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.leftView = paddingView
        self.leftViewMode = .always
    }
    func setRightPaddingPoints(_ amount:CGFloat) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.rightView = paddingView
        self.rightViewMode = .always
    }
}
