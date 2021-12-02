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
        let sut = makeSUT(with: viewControllerSpy)
        let expectedViewData: Restaurant.ViewState = .content(.restaurantMock)
        
        // When
        sut.presentRestaurantMenu(.contentMock)
        // Then
        
        guard let passedViewState = viewControllerSpy.displayRestaurantByViewStatePassed else {
            XCTFail("Could find displayRestaurantByViewStatePassed")
            return
        }
        
        XCTAssertTrue(viewControllerSpy.displayRestaurantCalled)
        XCTAssertEqual(String(describing: passedViewState), String(describing: expectedViewData))
    }
    
    func test_presentRestaurant_whenReceiveLoading_shouldPassCorrectStateToViewController() {
        // Given
        let viewControllerSpy = MenuDisplayLogicSpy()
        let sut = makeSUT(with: viewControllerSpy)
        let expectedViewData: Restaurant.ViewState = .loading
        
        // When
        sut.presentRestaurantMenu(.loadingMock)
        // Then
        
        guard let passedViewState = viewControllerSpy.displayRestaurantByViewStatePassed else {
            XCTFail("Could find displayRestaurantByViewStatePassed")
            return
        }
        
        XCTAssertTrue(viewControllerSpy.displayRestaurantCalled)
        XCTAssertEqual(String(describing: passedViewState), String(describing: expectedViewData))
    }
    
    func test_presentRestaurant_whenReceiveError_shouldPassCorrectStateToViewController() {
        // Given
        let viewControllerSpy = MenuDisplayLogicSpy()
        let sut = makeSUT(with: viewControllerSpy)
        let expectedViewData: Restaurant.ViewState = .error
        
        // When
        sut.presentRestaurantMenu(.errorMock)
        // Then
        
        guard let passedViewState = viewControllerSpy.displayRestaurantByViewStatePassed else {
            XCTFail("Could find displayRestaurantByViewStatePassed")
            return
        }
        
        XCTAssertTrue(viewControllerSpy.displayRestaurantCalled)
        XCTAssertEqual(String(describing: passedViewState), String(describing: expectedViewData))
    }
    
    // MARK: - Test Helpers
    
    private func makeSUT(with viewController: MenuDisplayLogic = MenuDisplayLogicDummy()) -> MenuPresenter {
        let sut = MenuPresenter()
        sut.viewController = viewController
        return sut
    }
}



final class MenuDisplayLogicSpy: MenuDisplayLogic {
    
    // MARK: - Properties Helpers
    
    private(set) var displayRestaurantCalled = false
    private(set) var displayRestaurantByViewStatePassed: Restaurant.ViewState?
    
    func displayRestaurant(_ viewState: Restaurant.ViewState) {
        displayRestaurantCalled = true
        displayRestaurantByViewStatePassed = viewState
    }
}
