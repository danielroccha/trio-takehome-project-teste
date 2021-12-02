//
//  MenuViewController.swift
//  restaurant menu
//
//  Created by Daniel Rocha on 26/11/21.
//

import Foundation
import UIKit

protocol MenuDisplayLogic: AnyObject {
    func displayRestaurant(_ viewState: Restaurant.ViewState)
}

protocol MenuViewControllerDelegate: AnyObject {
    func didSelect(menuSection: Int)
}

class MenuViewController: UIViewController {
    
    // MARK: - Dependencies
    
    private let interactor: MenuBusinessLogic
    
    // MARK: - Properties
    
    private var restaurant: Restaurant.ViewModel?
    private var restaurantId: Int?
    private var menuSectionSeleted: Int = .zero
    
    // MARK: - Layout
    
    private lazy var customView: MenuView = {
        let view = MenuView(
            tableViewDelegate: self,
            tableViewDataSource: self,
            handleSelectItem: { [weak self] valueSelected in
                self?.setMenuSection(value: valueSelected)
            }
        )
        return view
    }()
    
    // MARK: - Initialization
    
    init(
        interactor: MenuBusinessLogic
    ) {
        self.interactor = interactor
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle
    
    override func loadView() {
        setupTabViewController()
        view = customView
        
    }
    
    override func viewDidLoad() {
        interactor.viewDidLoad(restaurantId: 38231304122631340)
    }
    
    private func setupTabViewController() {
        guard let font = UIFont(font: FontFamily.Montserrat.regular, size: 16) else { return }
        self.navigationController?.navigationBar.barTintColor = .white
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: font]
    }
    
    private func setMenuSection(value: Int) {
        menuSectionSeleted = value
        customView.tableView.reloadData()
    }
    
    private func setEmptyMessage(tableView: UITableView) {
        let messageLabel = UILabel(frame: CGRect(x: 0, y: 0, width: tableView.bounds.size.width, height: tableView.bounds.size.height))
        messageLabel.text = L10n.emptyMessage
        messageLabel.textColor = Asset.Colors.blackMain.color
        messageLabel.numberOfLines = 0
        messageLabel.textAlignment = .center
        messageLabel.font = UIFont(font: FontFamily.Montserrat.regular, size: 15)
        messageLabel.sizeToFit()
        
        tableView.backgroundView = messageLabel
        tableView.separatorStyle = .none
    }
}

// MARK: - UITableViewDelegate, UITableViewDataSource

extension MenuViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let menusSections = restaurant?.menuSections else { return .zero }
        let menuItems = menusSections[menuSectionSeleted].menusItems
        switch menuItems.count == .zero {
        case true:
            setEmptyMessage(tableView: tableView)
            return .zero
        case false:
            return menuItems.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: MenuItemCell.self), for: indexPath)
        
        guard let menuItemCell = cell as? MenuItemCell else { preconditionFailure("MenuItemCell  not registered") }
        
        guard let menusSections = restaurant?.menuSections else { return UITableViewCell()}
        
        let menuItem = menusSections[menuSectionSeleted].menusItems[indexPath.row]
        
        let viewModel: MenuItemCell.ViewModel = .init(
            plateName: menuItem.name,
            ingredients: menuItem.description ?? L10n.noDescription,
            price: menuItem.price
        )
        
        menuItemCell.viewModel = viewModel
        
        return menuItemCell
    }
}

// MARK: - MenuDisplayLogic

extension MenuViewController: MenuDisplayLogic {
    func displayRestaurant(_ viewState: Restaurant.ViewState) {
        switch viewState {
        case let .content(restaurantData):
            title = restaurantData.restaurantName
            restaurant = restaurantData
            customView.setViewModel(viewModel: restaurantData)
            customView.tableView.reloadData()
            customView.stopLoading()
            
        case .loading:
            customView.startLoading()
            
        case .error:
            print("error")
        }
    }
}
