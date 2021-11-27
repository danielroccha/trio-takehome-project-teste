//
//  MenuPresenter.swift
//  restaurant menu
//
//  Created by Daniel Rocha on 26/11/21.
//

import Foundation


protocol MenuPresentationLogic {
    func presentRestaurantMenu(data: Restaurant)
    func presentErrorRestaurantMenu()
}

final class MenuPresenter: MenuPresentationLogic {
    weak var viewController: MenuDisplayLogic?

    func presentRestaurantMenu(data: Restaurant) {
        
    }
    
    func presentErrorRestaurantMenu() {
        
    }
}
