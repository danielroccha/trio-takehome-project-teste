//
//  GetRestaurantUseCase.swift
//  restaurant menu
//
//  Created by Daniel Rocha on 27/11/21.
//

import Foundation

protocol GetRestaurantUseCaseProvider {
    func execute(from restaurantId: Int, then handle: @escaping (Result<RestaurantResponseEntity.Response.Restaurant, RestaurantServiceError>) -> Void)
}

final class GetRestaurantUseCase: GetRestaurantUseCaseProvider {
    // MARK: - Dependecies
    
    private let service: RestaurantAPIProvider
    
    init(service: RestaurantAPIProvider) {
        self.service = service
    }
    
    func execute(from restaurantId: Int, then handle: @escaping (Result<RestaurantResponseEntity.Response.Restaurant, RestaurantServiceError>) -> Void) {
        service.getRestaurantBy(restaurantId: restaurantId) { result in
            switch result {
            case .success(let data):
                handle(.success(data))
            case .failure(let error):
                handle(.failure(error))
            }
        }
    }
}
