//
//  MenuView.swift
//  restaurant menu
//
//  Created by Daniel Rocha on 26/11/21.
//

import UIKit

final class MenuView: CodedView {
    
    // MARK: - View components
    
    private let menuLabel: UILabel = {
        let menuLabel = UILabel()
        menuLabel.textAlignment = .center
        menuLabel.text = "MENU"
        menuLabel.adjustsFontSizeToFitWidth = true
        menuLabel.textColor = .black
        menuLabel.font = UIFont(name: "Montserrat-Regular", size: 15.0)
        return menuLabel
    }()
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(MenuItemCell.self, forCellReuseIdentifier: String(describing: MenuItemCell.self))
        return tableView
    }()
    
    // MARK: - Initialization
    
    init(
        tableViewDelegate: UITableViewDelegate,
        tableViewDataSource: UITableViewDataSource
    ) {
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
        addSubview(tableView)
    }
    
    override func addConstraints() {
        menuLabelConstraint()
        tableViewConstraint()
    }
    
    // MARK: - Private methods
    private func menuLabelConstraint() {
        menuLabel.anchor(
            top: safeAreaLayoutGuide.topAnchor,
            leading: leadingAnchor,
            trailing: trailingAnchor,
            topConstant: 50,
            bottomConstant: 44
        )
    }
    
    private func tableViewConstraint() {
        tableView.anchor(
            top: menuLabel.bottomAnchor,
            leading: leadingAnchor,
            bottom: bottomAnchor,
            trailing: trailingAnchor,
            topConstant: 20
        )
    }
}
