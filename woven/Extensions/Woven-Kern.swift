//
//  Woven-Kern.swift
//  woven
//
//  Created by Jackson Fall on 2/27/16.
//
//

import UIKit

extension UILabel {
    func kern(kerningValue:CGFloat) {
        self.attributedText =  NSAttributedString(string: self.text ?? "", attributes: [NSKernAttributeName:kerningValue, NSFontAttributeName:font, NSForegroundColorAttributeName:self.textColor])
    }
}

extension UIButton {
    func kern(kerningValue:CGFloat) {
        let attributedText =  NSAttributedString(string: self.titleLabel!.text!, attributes: [NSKernAttributeName:kerningValue, NSFontAttributeName:self.titleLabel!.font, NSForegroundColorAttributeName:self.titleLabel!.textColor])
        self.setAttributedTitle(attributedText, forState: UIControlState.Normal)
    }
}