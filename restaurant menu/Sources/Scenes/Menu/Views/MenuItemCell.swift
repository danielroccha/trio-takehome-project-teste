//
//  MenuItemCell.swift
//  restaurant menu
//
//  Created by Daniel Rocha on 27/11/21.
//

import UIKit

final class MenuItemCell: CodedTableViewCell {
    
    private let view: UIView = {
        let view = UIView()
        return view
    }()
    
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.spacing = 20
        stackView.axis = .vertical
        return stackView
    }()
    
    private let titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.textAlignment = .center
        titleLabel.font = UIFont(name: "PlayfairDisplay-Regular", size: 25.0)
        titleLabel.text = "Pear Salad"
        return titleLabel
    }()
    
    private let ingredientsLabel: UILabel = {
        let ingredientsLabel = UILabel()
        ingredientsLabel.numberOfLines = .zero
        ingredientsLabel.textAlignment = .center
        ingredientsLabel.font = UIFont(name: "PlayfairDisplay-Regular", size: 16.0)
        ingredientsLabel.text = "Reid’s Orchard Pears / Bitter Greens / Granola / Firefly Farms Black and Blue / Pine Nut Vinaigrette"
        return ingredientsLabel
    }()
    
    private let priceLabel: UILabel = {
        let priceLabel = UILabel()
        priceLabel.textAlignment = .center
        priceLabel.font = UIFont(name: "Montserrat-Regular", size: 15.0)
        priceLabel.text = "$ 15"
        return priceLabel
    }()
    
    override func addSubviews() {
        contentView.addSubview(view)
        view.addSubview(stackView)
        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(ingredientsLabel)
        stackView.addArrangedSubview(priceLabel)
    }
    
    override func addConstraints() {
        viewConstraint()
        stackViewConstraint()
    }
    
    private func viewConstraint() {
        view.anchor(
            top: contentView.topAnchor,
            leading: contentView.leadingAnchor,
            bottom: contentView.bottomAnchor,
            trailing: contentView.trailingAnchor,
            leadingConstant: 8,
            trailingConstant: 8,
            widthConstant: 20
        )
    }
    
    private func stackViewConstraint() {
        stackView.anchor(
            top: view.topAnchor,
            leading: view.leadingAnchor,
            bottom: view.bottomAnchor,
            trailing: view.trailingAnchor,
            topConstant: 30,
            leadingConstant: 50,
            bottomConstant: 30,
            trailingConstant: 50
        )
    }
}
