//
//  RestaurantRequest.swift
//  restaurant menu
//
//  Created by Daniel Rocha on 26/11/21.
//

import Foundation
import Alamofire

enum RestaurantRequest: URLRequestConvertible {
    
    case getRestaurant(restaurantId: Int)
    case restaurants
    
    // MARK: - HTTPMethod
    private var method: HTTPMethod {
        return .get
    }
    
    // MARK: - HTTPHeaders
    private var headers: [String : String] {
        switch self {
        default:
            return [:]
        }
    }
    
    // MARK: - Path
    private var path: String {
        switch self {
        case .getRestaurant(let restaurantId):
            return "/restaurant/\(restaurantId)"
        case .restaurants:
            return "abacate"
        }
    }
    
    // MARK: - URLRequestConvertible
    func asURLRequest() throws -> URLRequest {
        let url = try Constants.Networking.baseURL.asURL()
        
        var urlRequest = URLRequest(url: url.appendingPathComponent(path))
        urlRequest.httpMethod = method.rawValue
        
        if isAuthenticated {
            let apiKeyHeader = ["X-API-KEY": Constants.Networking.apiKey]
            let headers = self.headers.merging(apiKeyHeader) {current , _ in current}
            urlRequest.headers = .init(headers)
        }
        
        return urlRequest
    }
    
    var isAuthenticated: Bool {
        switch self {
        case .restaurants:
            return true
        case .getRestaurant:
            return true
        default:
            return false
        }
    }
}
