//
//  MenuInteractor.swift
//  restaurant menu
//
//  Created by Daniel Rocha on 26/11/21.
//

import Foundation

protocol MenuBusinessLogic {
    func viewDidLoad(restaurantId: Int)
}

final class MenuInteractor: MenuBusinessLogic {
    
    // MARK: - Dependencies
    private let presenter: MenuPresentationLogic
    private let getRestaurantUseCase: GetRestaurantUseCaseProvider
    
    // MARK: - Initialization
    init(
        presenter: MenuPresentationLogic,
        getRestaurantUseCase: GetRestaurantUseCaseProvider
    ) {
        self.presenter = presenter
        self.getRestaurantUseCase = getRestaurantUseCase
    }
    
    // MARK: - Public methods
    func viewDidLoad(restaurantId: Int) {
        getRestaurantUseCase.execute(from: restaurantId) { [weak self]result in
            switch result {
            case .success(let data):
                guard let restaurant = self?.parseDomainRestaurant(from: data) else { return }
                self?.presenter.presentRestaurantMenu(data: restaurant)
                
            case .failure(let error):
                self?.presenter.presentErrorRestaurantMenu()
                
            }
        }
    }
    
    // MARK: - Private methods
    private func parseDomainRestaurant(from data: RestaurantResponseEntity.Response.Restaurant) -> Restaurant {
        let menus = parseDomainRestaurantMenu(from: data.menus)
        
        let restaurant: Restaurant = .init(
            restaurantName: data.restaurantName,
            restaurantPhone: data.restaurantPhone,
            restaurantWebsite: data.restaurantWebsite,
            hours: data.hours,
            priceRange: data.priceRange,
            priceRangeNum: data.priceRangeNum,
            restaurantId: data.restaurantId,
            cuisines: data.cuisines,
            menus: menus,
            lastUpdated: data.lastUpdated
        )
        
        return restaurant
    }
    
    private func parseDomainRestaurantMenu(from data: [RestaurantResponseEntity.Response.Menu]) -> [Restaurant.Menu] {
        let menus: [Restaurant.Menu] = data.map { menu -> Restaurant.Menu in
            let menuSectionDomain = parseDomainRestaurantMenuSection(from: menu.menuSections)
            
            let menuDomain: Restaurant.Menu = .init(
                menuName: menu.menuName,
                menusSections: menuSectionDomain
            )
            return menuDomain
        }
        
        return menus
    }
    
    private func parseDomainRestaurantMenuSection(from data: [RestaurantResponseEntity.Response.MenuSection]) -> [Restaurant.MenuSection] {
        let menuSectionsDomain: [Restaurant.MenuSection] = data.map { menuSection -> Restaurant.MenuSection in
            let menuItems = parseDomainRestaurantMenuItem(from: menuSection.menuItems)
            
            return .init(
                sectionName: menuSection.sectionName,
                descritption: menuSection.description,
                menusItems: menuItems
            )
        }
        
        return menuSectionsDomain
    }
    
    private func parseDomainRestaurantMenuItem(from data: [RestaurantResponseEntity.Response.MenuItem]) -> [Restaurant.MenuItem] {
        let menuItems = data.map { menuItem -> Restaurant.MenuItem in
            .init(
                name: menuItem.name,
                descritption: menuItem.description,
                price: menuItem.price
            )
        }
        
        return menuItems
    }
}
