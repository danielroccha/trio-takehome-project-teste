//
//  MenuSectionCell.swift
//  restaurant menu
//
//  Created by Daniel Rocha on 27/11/21.
//

import UIKit

final class MenuSectionCell: CodedCollectionViewCell {
    
    struct ViewModel {
        var selected: Bool
        var handleTapSelect: () -> Void
        var sectionName: String
    }
    
    private let sectionNameLabel: UILabel = {
        let sectionNameLabel = UILabel()
        sectionNameLabel.text = "SMALL PLATES PLATES"
        sectionNameLabel.textColor = .black
        sectionNameLabel.font = UIFont(name: "Montserrat-Regular", size: 14.0)
        return sectionNameLabel
    }()
    
    private lazy var borderView: UIView = {
        let border = UIView()
        let borderWidth: CGFloat = 2
        border.backgroundColor = .black
        border.autoresizingMask = [.flexibleWidth, .flexibleTopMargin]
        border.frame = CGRect(x: 0, y: frame.size.height - borderWidth, width: frame.size.width, height: borderWidth)
        return border
    }()
    
    var viewModel: ViewModel? {
        didSet {
            setCellSelected()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let tapAction = UITapGestureRecognizer(target: self, action: #selector(handleTap))
        isUserInteractionEnabled = true
        addGestureRecognizer(tapAction)
    }
    
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func addSubviews() {
        contentView.addSubview(sectionNameLabel)
        addSubview(borderView)
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
    
    private func setCellSelected () {
        guard let viewModel = viewModel else { return }
        borderView.isHidden = !viewModel.selected
        sectionNameLabel.text = viewModel.sectionName.uppercased()
    }
    
    @objc
    private func handleTap() {
        
        viewModel?.handleTapSelect()
    }
}
