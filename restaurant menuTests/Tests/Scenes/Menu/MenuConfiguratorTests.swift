//
//  MenuConfigurator.swift
//  restaurant menuTests
//
//  Created by Daniel Rocha on 30/11/21.
//

@testable import restaurant_menu
import XCTest
    
final class MenuConfiguratorTests: XCTestCase {
    func test_configurator_shouldReturnCorrectlyConfiguredInstance() {
        // Given
        let sut = MenuConfigurator()
        
        // When
        let viewController = sut.resolveMenuViewController()
        
        // Then
        guard let interactor = Mirror(reflecting: viewController).children.compactMap({ child -> MenuInteractor? in
            if child.value is MenuInteractor {
                return child.value as? MenuInteractor
            }
            return nil
        }).first else {
            XCTFail("Could not find MenuInteractor")
            return
        }
        
        guard let presenter = Mirror(reflecting: interactor).children.compactMap({ child -> MenuPresenter? in
            if child.value is MenuPresenter {
                return child.value as? MenuPresenter
            }
            return nil
        }).first else {
            XCTFail("Could not find MenuPresenter")
            return
        }
        
        XCTAssertNotNil(presenter.viewController)
        XCTAssertTrue(presenter.viewController is MenuViewController)
    }
}
