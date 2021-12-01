//
//  MenuInteractor.swift
//  restaurant menu
//
//  Created by Daniel Rocha on 26/11/21.
//

import Foundation

protocol MenuBusinessLogic {
    func viewDidLoad(restaurantId: Int)
}

final class MenuInteractor: MenuBusinessLogic {
    
    // MARK: - Dependencies
    private let presenter: MenuPresentationLogic
    private let getRestaurantUseCase: GetRestaurantUseCaseProvider
    
    // MARK: - Initialization
    init(
        presenter: MenuPresentationLogic,
        getRestaurantUseCase: GetRestaurantUseCaseProvider
    ) {
        self.presenter = presenter
        self.getRestaurantUseCase = getRestaurantUseCase
    }
    
    // MARK: - Public methods
    func viewDidLoad(restaurantId: Int) {
        presenter.presentRestaurantMenu(.init(state: .loading))
        getRestaurantUseCase.execute(from: restaurantId) { [weak self] result in
            switch result {
            case .success(let response):
                let response = Restaurant.Response.DataResponse(restaurant: response)
                self?.presenter.presentRestaurantMenu(.init(state: .content(response)))
                
            case .failure:
                self?.presenter.presentRestaurantMenu(.init(state: .error))
                
            }
        }
    }
}
