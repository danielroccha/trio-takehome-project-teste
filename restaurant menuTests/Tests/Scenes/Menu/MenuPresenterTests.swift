//
//  MenuPresenterTests.swift
//  restaurant menuTests
//
//  Created by Daniel Rocha on 30/11/21.
//

import XCTest
@testable import restaurant_menu

final class MenuPresenterTests: XCTestCase {
    func test_presentRestaurant_whenReceiveContent_shouldPassCorrectStateToViewController() {
        // Given
        let viewControllerSpy = MenuDisplayLogicSpy()
        // When
        
        // Then
    }
}

final class MenuDisplayLogicSpy: MenuDisplayLogic {
    
    // MARK: - Properties Helpers
    
    private(set) var displayRestaurantCalled = false
    private(set) var displayRestaurantByStateViewStatePassed = false
    
    func displayRestaurant(viewState: Restaurant.ViewState) {
        
    }
    
    
}
