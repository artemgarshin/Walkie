//
//  StackView + Extension.swift
//  Walkie
//
//  Created by Артем Гаршин on 08.11.2022.
//

import Foundation
import UIKit



extension UIStackView{
    
    convenience init(arrangedSubviews: [UIView], axis: NSLayoutConstraint.Axis, spacing: CGFloat){
        
        self.init(arrangedSubviews: arrangedSubviews)
        self.axis = axis
        self.spacing = spacing
        
        
    }
    
    
}
