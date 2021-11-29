//
//  MenuItemCell.swift
//  restaurant menu
//
//  Created by Daniel Rocha on 27/11/21.
//

import UIKit

final class MenuItemCell: CodedTableViewCell {
    
    // MARK: - Constants
    private enum ViewMetrics {
        enum View {
            static let marginLeft: CGFloat = 8.0
            static let marginRight: CGFloat = 8.0
            static let width: CGFloat = 20.0
        }
        
        enum StackView {
            static let marginVertical: CGFloat = 30.0
            static let marginHorizontal: CGFloat = 50.0
        }
    }
    
    // MARK: - View components
    
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
        titleLabel.textColor = Asset.Colors.blackMain.color
        titleLabel.font = UIFont(name: FontFamily.PlayfairDisplay.regular.name, size: 25.0)
        return titleLabel
    }()
    
    private let ingredientsLabel: UILabel = {
        let ingredientsLabel = UILabel()
        ingredientsLabel.numberOfLines = .zero
        ingredientsLabel.textAlignment = .center
        ingredientsLabel.textColor = Asset.Colors.darkGray.color
        ingredientsLabel.font = UIFont(name: FontFamily.PlayfairDisplay.regular.name, size: 16.0)
        return ingredientsLabel
    }()
    
    private let priceLabel: UILabel = {
        let priceLabel = UILabel()
        priceLabel.textAlignment = .center
        priceLabel.textColor = Asset.Colors.darkGray.color
        priceLabel.font = UIFont(name: FontFamily.Montserrat.regular.name, size: 14.0)
        return priceLabel
    }()
    
    struct ViewModel {
        var plateName: String
        var ingredients: String
        var price: Double
    }
    
    var viewModel: ViewModel? {
        didSet {
            guard let viewModel = viewModel else { return }
            titleLabel.text = viewModel.plateName
            ingredientsLabel.text = viewModel.ingredients
            priceLabel.text = "$ \(viewModel.price)"
        }
    }
    
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
    
    // MARK: - Private methods
    
    private func viewConstraint() {
        view.anchor(
            top: contentView.topAnchor,
            leading: contentView.leadingAnchor,
            bottom: contentView.bottomAnchor,
            trailing: contentView.trailingAnchor,
            leadingConstant: ViewMetrics.View.marginLeft,
            trailingConstant: ViewMetrics.View.marginRight,
            widthConstant: ViewMetrics.View.width
        )
    }
    
    private func stackViewConstraint() {
        stackView.anchor(
            top: view.topAnchor,
            leading: view.leadingAnchor,
            bottom: view.bottomAnchor,
            trailing: view.trailingAnchor,
            topConstant: ViewMetrics.StackView.marginVertical,
            leadingConstant: ViewMetrics.StackView.marginHorizontal,
            bottomConstant: ViewMetrics.StackView.marginVertical,
            trailingConstant: ViewMetrics.StackView.marginHorizontal
        )
    }
}
