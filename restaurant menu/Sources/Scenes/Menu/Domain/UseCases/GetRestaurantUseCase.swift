//
//  GetRestaurantUseCase.swift
//  restaurant menu
//
//  Created by Daniel Rocha on 27/11/21.
//

import Foundation

protocol GetRestaurantUseCaseProvider {
    func execute(from restaurantId: Int, then handle: @escaping (Result<RestaurantUseCaseModel, RestaurantServiceError>) -> Void)
}

final class GetRestaurantUseCase: GetRestaurantUseCaseProvider {
    // MARK: - Dependecies
    
    private let service: RestaurantAPIProvider
    
    init(service: RestaurantAPIProvider) {
        self.service = service
    }
    
    func execute(from restaurantId: Int, then handle: @escaping (Result<RestaurantUseCaseModel, RestaurantServiceError>) -> Void) {
        service.getRestaurantBy(restaurantId: restaurantId) { [weak self] result in
            switch result {
            case .success(let data):
                guard let restaurant = self?.parseDomainRestaurant(from: data) else { return }
                handle(.success(restaurant))
            case .failure(let error):
                handle(.failure(error))
            }
        }
    }
    
    // MARK: - Private methods
    private func parseDomainRestaurant(from data: RestaurantResponseEntity.Response.Restaurant) -> RestaurantUseCaseModel {
        let menus = parseDomainRestaurantMenu(from: data.menus)
        
        let restaurant: RestaurantUseCaseModel = .init(
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
    
    private func parseDomainRestaurantMenu(from data: [RestaurantResponseEntity.Response.Menu]) -> [RestaurantUseCaseModel.Menu] {
        let menus: [RestaurantUseCaseModel.Menu] = data.map { menu -> RestaurantUseCaseModel.Menu in
            let menuSectionDomain = parseDomainRestaurantMenuSection(from: menu.menuSections)
            
            let menuDomain: RestaurantUseCaseModel.Menu = .init(
                menuName: menu.menuName,
                menusSections: menuSectionDomain
            )
            return menuDomain
        }
        
        return menus
    }
    
    private func parseDomainRestaurantMenuSection(from data: [RestaurantResponseEntity.Response.MenuSection]) -> [RestaurantUseCaseModel.MenuSection] {
        let menuSectionsDomain: [RestaurantUseCaseModel.MenuSection] = data.map { menuSection -> RestaurantUseCaseModel.MenuSection in
            let menuItems = parseDomainRestaurantMenuItem(from: menuSection.menuItems)
            
            return .init(
                sectionName: menuSection.sectionName,
                descritption: menuSection.description,
                menusItems: menuItems
            )
        }
        
        return menuSectionsDomain
    }
    
    private func parseDomainRestaurantMenuItem(from data: [RestaurantResponseEntity.Response.MenuItem]) -> [RestaurantUseCaseModel.MenuItem] {
        let menuItems = data.map { menuItem -> RestaurantUseCaseModel.MenuItem in
            .init(
                name: menuItem.name,
                description: menuItem.description,
                price: menuItem.price
            )
        }
        
        return menuItems
    }
}
