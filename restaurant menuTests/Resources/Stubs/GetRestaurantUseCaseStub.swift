//
//  GetRestaurantUseCaseStub.swift
//  restaurant menuTests
//
//  Created by Daniel Rocha on 30/11/21.
//

import Foundation
@testable import restaurant_menu

final class GetRestaurantUseCaseStub: GetRestaurantUseCaseProvider {
    var getRestaurantUseCaseToBeReturned: Result<RestaurantUseCaseModel,
                                                 RestaurantServiceError> = .success(.restaurantMock)
    
    func execute(from restaurantId: Int, then handle: @escaping (Result<RestaurantUseCaseModel, RestaurantServiceError>) -> Void) {
        handle(getRestaurantUseCaseToBeReturned)
    }
}
