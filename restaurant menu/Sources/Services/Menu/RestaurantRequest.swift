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
        }
    }
    
    private func checkIsAuthtenticate(headers: [String : String]) -> [String : String] {
        var headers: [String : String] = [:]
        
        if isAuthenticated {
            let apiKeyHeader = ["X-API-KEY": Constants.Networking.apiKey]
            headers = self.headers.merging(apiKeyHeader) {current , _ in current}
        }
        
        return headers
    }
    
    // MARK: - URLRequestConvertible
    
    func asURLRequest() throws -> URLRequest {
        let url = try Constants.Networking.baseURL.asURL()
        
        var urlRequest = URLRequest(url: url.appendingPathComponent(path))
        urlRequest.httpMethod = method.rawValue
        
        let headerAuthenticate = checkIsAuthtenticate(headers: headers)
        let headerData = self.headers.merging(headerAuthenticate) {current , _ in current}
        urlRequest.headers = .init(headerData)
        
        return urlRequest
    }
    
    var isAuthenticated: Bool {
        switch self {
        case .getRestaurant:
            return true
        }
    }
}
