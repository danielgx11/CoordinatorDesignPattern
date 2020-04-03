//
//  FavoritesCoordinator.swift
//  CoordinatorPatternSwift5
//
//  Created by Daniel Gx on 02/04/20.
//  Copyright © 2020 Daniel Gx. All rights reserved.
//

import UIKit

protocol FavoritesFlow: class {
    func coordinateToDetail(_ title: FavoriteItem)
}

class FavoritesCoordinator: Coordinator, FavoritesFlow {
    
    // MARK: - Properties
    
    let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let favoritesTableView = FavoritesTableView()
        favoritesTableView.coordinator = self
        navigationController.pushViewController(favoritesTableView, animated: false)
    }
    
    // MARK: - Flow Methods
    
    func coordinateToDetail(_ title: FavoriteItem) {
        let favoritesDetailCoordinator = FavoritesDetailCoordinator(navigationController: navigationController, favoriteItemTitle: title)
        coordinate(to: favoritesDetailCoordinator)
    }
    
}
