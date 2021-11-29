//
//  RestaurantResponseEntity.swift
//  restaurant menu
//
//  Created by Daniel Rocha on 26/11/21.
//

import Foundation

enum RestaurantResponseEntity {
    struct Response: Codable {
        let result: Restaurant
        
        struct Restaurant: Codable {
            let restaurantName: String
            let restaurantPhone: String
            let restaurantWebsite: String
            let hours: String
            let priceRange: String
            let priceRangeNum: Int
            let restaurantId: Int
            let cuisines: [String]
            let address: Address
            let geo: Geo
            let menus: [Menu]
            let lastUpdated: String
            
            enum CodingKeys: String, CodingKey {
                case restaurantName = "restaurant_name"
                case restaurantPhone = "restaurant_phone"
                case restaurantWebsite = "restaurant_website"
                case priceRange = "price_range"
                case priceRangeNum = "price_range_num"
                case restaurantId = "restaurant_id"
                case lastUpdated = "last_updated"
                case menus, geo, address, cuisines, hours
            }
        }
        
        struct Address: Codable {
            let city: String
            let state: String
            let postalCode: String
            let street: String
            let formatted: String
            
            enum CodingKeys: String, CodingKey {
                case postalCode = "postal_code"
                case city, state, street, formatted
            }
        }
        
        struct Geo: Codable {
            let lat: Double
            let lon: Double
        }
        
        struct Menu: Codable {
            let menuName: String
            let menuSections: [MenuSection]
            
            enum CodingKeys: String, CodingKey {
                case menuName = "menu_name"
                case menuSections = "menu_sections"
            }
        }
        
        struct MenuSection: Codable {
            let sectionName: String
            let description: String?
            let menuItems: [MenuItem]
            
            enum CodingKeys: String, CodingKey {
                case sectionName = "section_name"
                case description
                case menuItems = "menu_items"
            }
        }
        
        struct MenuItem: Codable {
            let name: String
            let description: String?
            let pricing: [Pricing]
            let price: Double
        }
        
        struct Pricing: Codable {
            let price: Double
            let currency: String
            let priceString: String
        }
    }
}
