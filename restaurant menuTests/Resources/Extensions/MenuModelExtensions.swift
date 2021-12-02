//
//  MenuModelExtensions.swift
//  restaurant menuTests
//
//  Created by Daniel Rocha on 01/12/21.
//

import Foundation
@testable import restaurant_menu

extension Restaurant.Response {
    static var contentMock: Restaurant.Response {
        .init(state: .content(.dataResponseMock))
    }

    static var loadingMock: Restaurant.Response  {
        .init(state: .loading)
    }

    static var errorMock: Restaurant.Response {
        .init(state: .error)
    }
}

extension Restaurant.Response.DataResponse {
    static var dataResponseMock: Restaurant.Response.DataResponse {
        .init(restaurant: .restaurantMock)
    }
}

extension Restaurant.ViewModel {
    static var restaurantMock: Restaurant.ViewModel {
        .init(
            restaurantName: "Aqus Cafe",
            menuSections: [.menuSectionMock]
        )
    }
}

extension Restaurant.MenuSection {
    static var menuSectionMock: Restaurant.MenuSection {
        .init(
            sectionName: "Appetizers",
            menusItems: [.menuItemMock]
        )
    }
}

extension Restaurant.MenuItem {
    static var menuItemMock: Restaurant.MenuItem {
        .init(
            name: "Mediterranean Plate",
            description: "Falafel, Kalamata olives, hummus, baba ganoush with artisan flatbread",
            price: 8.75
        )
    }
}
