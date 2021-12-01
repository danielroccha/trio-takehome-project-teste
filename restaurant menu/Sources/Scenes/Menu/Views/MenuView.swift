//
//  MenuView.swift
//  restaurant menu
//
//  Created by Daniel Rocha on 26/11/21.
//

import UIKit

enum MenuListState {
    case empty
    case loading
    case content
}

final class MenuView: CodedView {
    
    // MARK: - Constants
    
    private enum ViewMetrics {
        enum MenuLabel {
            static let marginTop: CGFloat = 40.0
            static let marginBottom: CGFloat = 44.0
        }
        
        enum MenuSection {
            static let marginTop: CGFloat = 20.0
            static let height: CGFloat = 60.0
        }
    }
    
    // MARK: - View components
    
    private let menuLabel: UILabel = {
        let menuLabel = UILabel()
        menuLabel.textAlignment = .center
        menuLabel.text = L10n.menu
        menuLabel.adjustsFontSizeToFitWidth = true
        menuLabel.textColor = .black
        menuLabel.font = UIFont(font: FontFamily.Montserrat.regular, size: 14.0)
        return menuLabel
    }()
    
    lazy var menuSectionView = MenuSectionView(
        handleSelectItem: { [weak self] valueSelected in
            self?.handleSelectItem(valueSelected)
        }
    )
    
    let tableView: UITableView = {
        let tableView = UITableView()
        tableView.tableFooterView = UIView()
        tableView.separatorInset = UIEdgeInsets(
            top: .zero,
            left: 50,
            bottom: .zero,
            right: 50
        )
        tableView.separatorColor = Asset.Colors.gray.color
        tableView.backgroundColor = .white
        tableView.register(MenuItemCell.self, forCellReuseIdentifier: String(describing: MenuItemCell.self))
        return tableView
    }()
    
    private let spinnerLoadingView: UIActivityIndicatorView = {
        let spinner = UIActivityIndicatorView(style: .medium)
        spinner.isHidden = true
        return spinner
    }()
    
    // MARK: - Properties
    
    private var handleSelectItem: (Int) -> Void
    
    // MARK: - Initialization
    
    init(
        tableViewDelegate: UITableViewDelegate,
        tableViewDataSource: UITableViewDataSource,
        handleSelectItem: @escaping (Int) -> Void
    ) {
        self.handleSelectItem = handleSelectItem
        
        super.init(frame: .zero)
        
        tableView.delegate = tableViewDelegate
        tableView.dataSource = tableViewDataSource
        
        backgroundColor = .white
    }
    
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func addSubviews() {
        addSubview(menuLabel)
        addSubview(menuSectionView)
        addSubview(tableView)
        addSubview(spinnerLoadingView)
    }
    
    override func addConstraints() {
        menuLabelConstraint()
        menuSectionViewConstraint()
        tableViewConstraint()
        spinnerLoadingViewContraint()
    }
    
    // MARK: - Private methods
    
    private func menuLabelConstraint() {
        menuLabel.anchor(
            top: safeAreaLayoutGuide.topAnchor,
            leading: leadingAnchor,
            trailing: trailingAnchor,
            topConstant: ViewMetrics.MenuLabel.marginTop,
            bottomConstant: ViewMetrics.MenuLabel.marginBottom
        )
    }
    
    private func menuSectionViewConstraint() {
        menuSectionView.anchor(
            top: menuLabel.bottomAnchor,
            leading: leadingAnchor,
            trailing: trailingAnchor,
            topConstant: ViewMetrics.MenuSection.marginTop,
            heightConstant: ViewMetrics.MenuSection.height
        )
    }
    
    private func tableViewConstraint() {
        tableView.anchor(
            top: menuSectionView.bottomAnchor,
            leading: leadingAnchor,
            bottom: safeAreaLayoutGuide.bottomAnchor,
            trailing: trailingAnchor
        )
    }
    
    private func spinnerLoadingViewContraint() {
        spinnerLoadingView.anchor(
            top: topAnchor,
            leading: leadingAnchor,
            bottom: safeAreaLayoutGuide.bottomAnchor,
            trailing: trailingAnchor
        )
    }
    
    // MARK: - Public methods
    
    public func setViewModel(viewModel: Restaurant.ViewModel) {
        menuSectionView.setViewModel(viewModel:  viewModel)
    }
    
    public func startLoading() {
        spinnerLoadingView.startAnimating()
        spinnerLoadingView.isHidden = false
        
        menuSectionView.isHidden = true
        tableView.isHidden = true
    }
    
    public func stopLoading() {
        spinnerLoadingView.stopAnimating()
        spinnerLoadingView.isHidden = true
        
        menuSectionView.isHidden = false
        tableView.isHidden = false
    }
}
