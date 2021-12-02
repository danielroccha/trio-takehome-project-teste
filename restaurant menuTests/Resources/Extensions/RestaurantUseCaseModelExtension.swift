//
//  RestaurantExtension.swift
//  restaurant menuTests
//
//  Created by Daniel Rocha on 30/11/21.
//

import Foundation
@testable import restaurant_menu

extension RestaurantUseCaseModel {
    static var restaurantMock: RestaurantUseCaseModel {
        .init(
            restaurantName: "Aqus Cafe",
            restaurantPhone: "(707) 778-6060",
            restaurantWebsite: "",
            hours: "",
            priceRange: "$$",
            priceRangeNum: 2,
            restaurantId: 38231304122631340,
            cuisines: [""],
            menus: [.menuMock],
            lastUpdated: "2021-01-05T07:47:41.958Z"
        )
    }
}

extension RestaurantUseCaseModel.Menu {
    static var menuMock: RestaurantUseCaseModel.Menu {
        .init(
            menuName: "Main",
            menusSections: [.menuSectionMock]
        )
    }
}

extension RestaurantUseCaseModel.MenuSection {
    static var menuSectionMock: RestaurantUseCaseModel.MenuSection {
        .init(
            sectionName: "Appetizers",
            descritption: "",
            menusItems: [.menuItemMock]
        )
    }
}

extension RestaurantUseCaseModel.MenuItem {
    static var menuItemMock: RestaurantUseCaseModel.MenuItem {
        .init(
            name: "Mediterranean Plate",
            description: "Falafel, Kalamata olives, hummus, baba ganoush with artisan flatbread",
            price: 8.75
        )
    }
}
