//
//  Restaurant.swift
//  restaurant menu
//
//  Created by Daniel Rocha on 27/11/21.
//

import Foundation


struct RestaurantUseCaseModel {
    let restaurantName: String
    let restaurantPhone: String
    let restaurantWebsite: String
    let hours: String
    let priceRange: String
    let priceRangeNum: Int
    let restaurantId: Int
    let cuisines: [String]
    let menus: [Menu]
    let lastUpdated: String
    
    struct Menu {
        let menuName: String
        let menusSections: [MenuSection]
    }

    struct MenuSection {
        let sectionName: String
        let descritption: String?
        let menusItems: [MenuItem]
    }

    struct MenuItem {
        let name: String
        let description: String?
        let price: Double
    }
}


