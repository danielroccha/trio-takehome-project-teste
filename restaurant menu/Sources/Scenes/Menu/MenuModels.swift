//
//  MenuModels.swift
//  restaurant menu
//
//  Created by Daniel Rocha on 01/12/21.
//

import Foundation

enum Restaurant {
    struct Response {
        let state: State
        
        enum State {
            case error
            case loading
            case content(DataResponse)
        }
        
        struct DataResponse {
            let restaurant: RestaurantUseCaseModel
        }
    }
    
    enum ViewState {
        case loading
        case content(ViewModel)
    }
    
    struct ViewModel {
        let restaurantName: String
        let menuSections: [MenuSection]
    }
    
    struct MenuSection {
        let sectionName: String
        let menusItems: [MenuItem]
    }
    
    struct MenuItem {
        let name: String
        let description: String?
        let price: Double
    }
}
