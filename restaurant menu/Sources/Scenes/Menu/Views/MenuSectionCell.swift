//
//  MenuSectionCell.swift
//  restaurant menu
//
//  Created by Daniel Rocha on 27/11/21.
//

import UIKit

final class MenuSectionCell: CodedCollectionViewCell {
    
    private let sectionNameLabel: UILabel = {
        let sectionNameLabel = UILabel()
        sectionNameLabel.text = "SMALL PLATES"
        sectionNameLabel.textColor = .black
        sectionNameLabel.font = UIFont(name: "Montserrat-Regular", size: 16.0)
        return sectionNameLabel
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func addSubviews() {
        contentView.addSubview(sectionNameLabel)
    }
    
    override func addConstraints() {
       
        sectionNameLabelConstraint()
    }
    
    private func sectionNameLabelConstraint() {
        sectionNameLabel.anchor(
            top: contentView.topAnchor,
            leading: contentView.leadingAnchor,
            heightConstant: 60
        )
        sectionNameLabel.anchorCenterSuperView()
    }
}
