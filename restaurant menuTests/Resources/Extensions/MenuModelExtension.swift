//
//  RestaurantExtension.swift
//  restaurant menuTests
//
//  Created by Daniel Rocha on 30/11/21.
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

//extension RestaurantModel.Address {
//    static var addressMock: RestaurantModel.Address {
//        .init(
//            city: "Petaluma",
//            state: "CA",
//            postalCode: "94952",
//            street: "189 H St",
//            formatted: "189 H St Petaluma, CA 94952"
//        )
//    }
//}

//extension RestaurantModel.Geo {
//    static var geoMock: RestaurantModel.Geo {
//        .init(
//            lat: 38.231304,
//            lon: -122.631341
//        )
//    }
//}

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
//            pricing: [.pricingMock],
            price: 8.75
        )
    }
}

//extension RestaurantModel.Pricing {
//    static var pricingMock: RestaurantModel.Pricing {
//        .init(
//            price: 8.75,
//            currency: "USD",
//            priceString: "$8.75"
//        )
//    }
//}
