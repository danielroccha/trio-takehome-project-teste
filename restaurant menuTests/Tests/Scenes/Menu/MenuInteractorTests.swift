//
//  MenuInteractorTests.swift
//  restaurant menuTests
//
//  Created by Daniel Rocha on 30/11/21.
//

@testable import restaurant_menu
import XCTest

final class MenuInteractorTests: XCTestCase {
    
    func test_interactor_onViewDidLoad_shouldCallCorrectMethodInPresenter() {
        // Given
        let presenterSpy = MenuPresenterSpy()
        let interactorSUT = makeInteractorSUT(presenter: presenterSpy, getRestaurantUseCase: GetRestaurantUseCaseStub())
        let expectedResponse: Restaurant.Response = .contentMock
        
        // When
        interactorSUT.viewDidLoad(restaurantId: .zero)
        
        //Then
        guard let receivedResponse = presenterSpy.presentRestaurantResponsePassed else {
            XCTFail("Could not find presentRestaurantResponsePassed.")
            return
        }
        XCTAssertTrue(presenterSpy.presentRestaurantMenuCalled)
        XCTAssertEqual(String(describing: receivedResponse), String(describing: expectedResponse))
    }
    
    func test_interactor_whenReceiveError_shouldCallCorrectMethodInPresenter() {
        // Given
        let presenterSpy = MenuPresenterSpy()
        
        let getRestaurantUseCase = GetRestaurantUseCaseStub()
        getRestaurantUseCase.getRestaurantUseCaseToBeReturned = .failure(.network)
        let interactorSUT = makeInteractorSUT(presenter: presenterSpy, getRestaurantUseCase: getRestaurantUseCase)
        let expectedResponse: Restaurant.Response = .errorMock
        
        // When
        interactorSUT.viewDidLoad(restaurantId: .zero)
        
        //Then
        guard let receivedResponse = presenterSpy.presentRestaurantResponsePassed else {
            XCTFail("Could not find presentRestaurantResponsePassed.")
            return
        }
        XCTAssertTrue(presenterSpy.presentRestaurantMenuCalled)
        XCTAssertEqual(String(describing: receivedResponse), String(describing: expectedResponse))
    }
    
    // MARK: - Test Helpers
    
    private func makeInteractorSUT(presenter: MenuPresentationLogic, getRestaurantUseCase: GetRestaurantUseCaseProvider) -> MenuInteractor {
        .init(
            presenter: presenter,
            getRestaurantUseCase: getRestaurantUseCase
        )
    }
}

final class MenuPresenterSpy: MenuPresentationLogic {
    
    // MARK: - Properties Helpers
    
    private(set) var presentRestaurantMenuCalled = false
    private(set) var presentRestaurantResponsePassed: Restaurant.Response?
    
    func presentRestaurantMenu(_ response: Restaurant.Response) {
        presentRestaurantMenuCalled = true
        presentRestaurantResponsePassed = response
    }
}
