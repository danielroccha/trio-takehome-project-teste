//
//  MenuPresenter.swift
//  restaurant menu
//
//  Created by Daniel Rocha on 26/11/21.
//

import Foundation


protocol MenuPresentationLogic {
    func presentRestaurantMenu(_ response: Restaurant.Response)
}

final class MenuPresenter: MenuPresentationLogic {
    weak var viewController: MenuDisplayLogic?

    func presentRestaurantMenu(_ response: Restaurant.Response) {
        switch response.state {
        case let .content(data):
            let restaurant = data.restaurant
            guard let menuSectionsUseCase =  restaurant.menus.first?.menusSections else { return }
            let menuSectionsViewModel = parseToMenuSectionsViewModel(data: menuSectionsUseCase)
            
            let menuViewModel: Restaurant.ViewModel = .init(
                restaurantName: restaurant.restaurantName,
                menuSections: menuSectionsViewModel
            )
            
            viewController?.displayRestaurant(.content(menuViewModel))
        case .loading:
            viewController?.displayRestaurant(.loading)
            
        case .error:
            viewController?.displayRestaurant(.error)
            
        }
    }
    
    // MARK: - Private methods
    
    private func parseToMenuSectionsViewModel(data: [RestaurantUseCaseModel.MenuSection]) -> [Restaurant.MenuSection] {
        let menuSections = data.map({ menuSection -> Restaurant.MenuSection in
            let menuItems = parseToMenuItemViewModel(data: menuSection.menusItems)
            
            return .init(
                sectionName: menuSection.sectionName,
                menusItems: menuItems
            )
        })
        
        return menuSections
    }
    
    private func parseToMenuItemViewModel(data: [RestaurantUseCaseModel.MenuItem]) -> [Restaurant.MenuItem] {
        let menuItems = data.map({ menuItem -> Restaurant.MenuItem in
            .init(
                name: menuItem.name,
                description: menuItem.description,
                price: menuItem.price
            )
        })
        
        return menuItems
    }
}
