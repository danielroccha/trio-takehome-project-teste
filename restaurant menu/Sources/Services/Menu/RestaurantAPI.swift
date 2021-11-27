//
//  RestaurantAPIProvider.swift
//  restaurant menu
//
//  Created by Daniel Rocha on 26/11/21.
//

import Foundation
import Alamofire

enum RestaurantServiceError: Error {
    case responseParse
    case network
}

protocol RestaurantAPIProvider {
    func getRestaurantBy(restaurantId: Int, then handle: @escaping (Result<RestaurantResponseEntity.Response.Restaurant, RestaurantServiceError>) -> Void)
}

final class RestaurantAPI: RestaurantAPIProvider {
    func getRestaurantBy(restaurantId: Int, then handle: @escaping (Result<RestaurantResponseEntity.Response.Restaurant, RestaurantServiceError>) -> Void) {
        AF.request(RestaurantRequest.getRestaurant(restaurantId: restaurantId)).responseDecodable { (response: AFDataResponse<RestaurantResponseEntity.Response>) in
            switch response.result {
            case let .success(data):
                handle(.success(data.result))
            case let .failure(error):
                handle(.failure(.network))
            }
        }
    }
}
