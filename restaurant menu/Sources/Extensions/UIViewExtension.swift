//
//  UIViewExtension.swift
//  restaurant menu
//
//  Created by Daniel Rocha on 27/11/21.
//

import UIKit

extension UIView {
    
    enum ViewSide {
        case left, right, top, bottom
    }
    
    func addBorder(toSide sides: [ViewSide], with color: UIColor?, andWidth borderWidth: CGFloat) {
        sides.forEach { side in
            let border = UIView()
            
            switch side {
            case .left:
                border.backgroundColor = color
                border.frame = CGRect(x: 0, y: 0, width: borderWidth, height: frame.size.height)
                border.autoresizingMask = [.flexibleHeight, .flexibleRightMargin]
                
            case .right:
                border.backgroundColor = color
                border.autoresizingMask = [.flexibleHeight, .flexibleLeftMargin]
                border.frame = CGRect(x: frame.size.width - borderWidth, y: 0, width: borderWidth, height: frame.size.height)
                
            case .top:
                border.backgroundColor = color
                border.autoresizingMask = [.flexibleWidth, .flexibleBottomMargin]
                border.frame = CGRect(x: 0, y: 0, width: frame.size.width, height: borderWidth)
                
            case .bottom:
                border.backgroundColor = color
                border.autoresizingMask = [.flexibleWidth, .flexibleTopMargin]
                border.frame = CGRect(x: 0, y: frame.size.height - borderWidth, width: frame.size.width, height: borderWidth)
                
            }
            addSubview(border)
        }
    }
}
