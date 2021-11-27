//
//  UIView+AutoLayout.swift
//  restaurant menu
//
//  Created by Daniel Rocha on 26/11/21.
//

import UIKit

extension UIView {
    
    enum Dimensions: CGFloat {
        case zero = 0
        case xtiny = 4
        case tiny = 8
        case small = 16
        case base = 24
        case medium = 32
        case large = 48
        case xlarge = 64
    }
    
    @discardableResult
    func anchor(
        top:NSLayoutYAxisAnchor? = nil,
        leading: NSLayoutXAxisAnchor? = nil,
        bottom:NSLayoutYAxisAnchor? = nil,
        trailing: NSLayoutXAxisAnchor? = nil,
        topConstant: CGFloat = .zero,
        leadingConstant: CGFloat = .zero,
        bottomConstant: CGFloat = .zero,
        trailingConstant: CGFloat = .zero,
        widthConstant: CGFloat = .zero,
        heightConstant: CGFloat = .zero
    ) -> [NSLayoutConstraint] {
        translatesAutoresizingMaskIntoConstraints = false
        
        var anchors:[NSLayoutConstraint] = []
        
        if let top = top {
            anchors.append(topAnchor.constraint(equalTo: top, constant: topConstant))
        }
        
        if let leading = leading {
            anchors.append(leadingAnchor.constraint(equalTo: leading, constant: leadingConstant))
        }
        
        if let bottom = bottom {
            anchors.append(bottomAnchor.constraint(equalTo: bottom, constant: -bottomConstant))
        }
        
        if let trailing = trailing {
            anchors.append(trailingAnchor.constraint(equalTo: trailing, constant: -trailingConstant))
        }
        
        if widthConstant > 0 {
            anchors.append(widthAnchor.constraint(equalToConstant: widthConstant))
        }
        
        if heightConstant > 0 {
            anchors.append(heightAnchor.constraint(equalToConstant: heightConstant))
        }
        
        NSLayoutConstraint.activate(anchors)
        return anchors
    }
    
    
    func anchorCenterYToSuperView(constant: Dimensions = .zero) {
        translatesAutoresizingMaskIntoConstraints = false
        
        if let anchor = superview?.centerYAnchor {
            centerYAnchor.constraint(equalTo: anchor, constant: constant.rawValue).isActive = true
        }
    }
    
    
    func anchorCenterXToSuperView(constant: Dimensions = .zero) {
        translatesAutoresizingMaskIntoConstraints = false
        
        if let anchor = superview?.centerXAnchor{
            centerXAnchor.constraint(equalTo: anchor, constant: constant.rawValue).isActive = true
        }
    }
    
    func anchorCenterSuperView() {
        anchorCenterYToSuperView()
        anchorCenterXToSuperView()
    }
}

