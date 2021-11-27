//
//  MenuConfigurator.swift
//  restaurant menu
//
//  Created by Daniel Rocha on 27/11/21.
//

import Foundation

final class MenuConfigurator {
    func resolveMenuViewController() -> MenuViewController {
        let presenter = MenuPresenter()
        
        let restaurantService = RestaurantAPI()
        
        let getRestaurantUseCase = GetRestaurantUseCase(service: restaurantService)
        
        let interator = MenuInteractor(
            presenter: presenter,
            getRestaurantUseCase: getRestaurantUseCase
        )
        
        let viewController = MenuViewController(interactor: interator)
        
        presenter.viewController = viewController
        
        return viewController
    }
}
