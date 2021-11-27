//
//  Constants.swift
//  restaurant menu
//
//  Created by Daniel Rocha on 26/11/21.
//

import Foundation

enum Constants {
    
    case v1
    case v2
    
    enum Networking {
        static let baseURL = "https://api.documenu.com/v2"
        static let apiKey = "a4f495757ac50a21a730c4cd294ad1a7"
    }
    
    private var getVersionApi: String {
        switch self {
        case .v1:
            return Networking.baseURL + "/v1"
        case .v2:
            return Networking.baseURL + "/v2"

        }
    }
}
