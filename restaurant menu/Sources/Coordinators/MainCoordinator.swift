//
//  MainCoordinator.swift
//  restaurant menu
//
//  Created by Daniel Rocha on 26/11/21.
//

import Foundation
import UIKit

class MainCoordinator: Coordinator {
    var childCoordinators = [Coordinator]()
    
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let configurator = MenuConfigurator()
        let vc = configurator.resolveMenuViewController()
        navigationController.pushViewController(vc, animated: false)
    }
}
