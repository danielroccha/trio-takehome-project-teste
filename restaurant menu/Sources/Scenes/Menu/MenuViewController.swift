//
//  MenuViewController.swift
//  restaurant menu
//
//  Created by Daniel Rocha on 26/11/21.
//

import Foundation
import UIKit

protocol MenuDisplayLogic: AnyObject {
    func displayRestaurant(data: Restaurant)
}

protocol MenuViewControllerDelegate: AnyObject {
    func didSelect(menuSection: Int)
}

class MenuViewController: UIViewController {
    
    // MARK: - Dependencies
    
    private let interactor: MenuBusinessLogic
    private weak var delegate: MenuViewControllerDelegate?
    
    // MARK: - Properties
    
    private var restaurant: Restaurant?
    private var restaurantId: Int?
    
    // MARK: - Layout
    
    private lazy var customView: MenuView = {
        let view = MenuView(
            tableViewDelegate: self,
            tableViewDataSource: self
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
        view = customView
        title = "Aqus Cafe"
    }
    
    override func viewDidLoad() {
        //        interactor.viewDidLoad(restaurantId: 38231304122631340)
    }
}

// MARK: - MenuDisplayLogic
extension MenuViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        print("teste")
        return MenuSectionView()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 60
    }
}

// MARK: - MenuDisplayLogic
extension MenuViewController: MenuDisplayLogic {
    func displayRestaurant(data: Restaurant) {
        restaurant = data
    }
}
