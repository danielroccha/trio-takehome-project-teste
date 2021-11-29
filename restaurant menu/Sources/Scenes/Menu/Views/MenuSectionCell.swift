//
//  MenuSectionCell.swift
//  restaurant menu
//
//  Created by Daniel Rocha on 27/11/21.
//

import UIKit

final class MenuSectionCell: CodedCollectionViewCell {
    
    // MARK: - Constants
    
    private enum ViewMetrics {
        enum SectionNameLabel {
            static let height: CGFloat = 60.0
        }
    }
    
    // MARK: - View components
    
    private let sectionNameLabel: UILabel = {
        let sectionNameLabel = UILabel()
        sectionNameLabel.textColor = Asset.Colors.blackMain.color
        sectionNameLabel.font = UIFont(name: FontFamily.Montserrat.regular.name, size: 14.0)
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
    
    struct ViewModel {
        var selected: Bool
        var handleTapSelect: () -> Void
        var sectionName: String
    }
    
    var viewModel: ViewModel? {
        didSet {
            setCellSelected()
        }
    }
    
    // MARK: - Initialization
    
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
    
    // MARK: - Private methods
    
    private func sectionNameLabelConstraint() {
        sectionNameLabel.anchor(
            top: contentView.topAnchor,
            leading: contentView.leadingAnchor,
            heightConstant: ViewMetrics.SectionNameLabel.height
        )
        sectionNameLabel.anchorCenterSuperView()
    }
    
    private func setCellSelected () {
        guard let viewModel = viewModel else { return }
        borderView.isHidden = !viewModel.selected
        sectionNameLabel.text = viewModel.sectionName.uppercased()
        sectionNameLabel.textColor = viewModel.selected ? .black : .lightGray
    }
    
    @objc
    private func handleTap() {
        viewModel?.handleTapSelect()
    }
}
