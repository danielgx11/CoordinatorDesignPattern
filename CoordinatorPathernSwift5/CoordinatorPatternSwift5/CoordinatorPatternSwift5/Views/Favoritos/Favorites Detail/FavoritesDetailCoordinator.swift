//
//  FavoritesDetailCoordinator.swift
//  CoordinatorPatternSwift5
//
//  Created by Daniel Gx on 02/04/20.
//  Copyright © 2020 Daniel Gx. All rights reserved.
//

import UIKit

protocol FavoritesDetailFlow {
    func dismissDetail()
}

class FavoritesDetailCoordinator: Coordinator, FavoritesDetailFlow {
    
    // MARK: - Properties
    
    let navigationController: UINavigationController
    let favoriteItemTitle: FavoriteItem

    
    init(navigationController: UINavigationController, favoriteItemTitle: FavoriteItem) {
        self.navigationController = navigationController
        self.favoriteItemTitle = favoriteItemTitle
    }
    
    func start() {
        let favoritesDetailViewController = FavoritesDetailViewController()
        favoritesDetailViewController.favoriteItemTitle = favoriteItemTitle
        favoritesDetailViewController.coordinator = self
        navigationController.present(favoritesDetailViewController, animated: true, completion: nil)
    }
    
    // MARK: - Flow Methods
    
    func dismissDetail() {
        navigationController.dismiss(animated: true, completion: nil)
    }
}
