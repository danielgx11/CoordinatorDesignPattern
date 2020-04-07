//
//  TabBarCoordinator.swift
//  CoordinatorPatternSwift5
//
//  Created by Daniel Gx on 02/04/20.
//  Copyright © 2020 Daniel Gx. All rights reserved.
//

import UIKit

class TabBarCoordinator: Coordinator {
    
    // MARK: - Variables
    
    let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    // MARK: - Methods
    
    func start() {
        let tabBarController = TabBarController()
        tabBarController.coordinator = self
        
        let testNavigationController = UINavigationController()
        testNavigationController.tabBarItem = UITabBarItem(tabBarSystemItem: .history, tag: 0)
        let testCoordinator = TestCoordinator(navigationController: testNavigationController)
        
        let favoritesNavigationController = UINavigationController()
        favoritesNavigationController.tabBarItem = UITabBarItem(tabBarSystemItem: .favorites, tag: 1)
        let favoritesCoordinator = FavoritesCoordinator(navigationController: favoritesNavigationController)
        
        let learnNavigationController = UINavigationController()
        learnNavigationController.tabBarItem = UITabBarItem(title: "Learn", image: UIImage(named: "learnIcon"), tag: 2)
        let learnCoordinator = LearnCoordinator(navigationController: learnNavigationController)
        
        let trashNavigationController = UINavigationController()
        trashNavigationController.tabBarItem = UITabBarItem(title: "Trash", image: UIImage(named: "trashIcon"), tag: 3)
        let trashCoordinator = TrashCoordinator(navigationController: trashNavigationController)
        
        let moreNavigationController = UINavigationController()
        moreNavigationController.tabBarItem = UITabBarItem(tabBarSystemItem: .more, tag: 4)
        let moreCoordinator = MoreCoordinator(navigationController: moreNavigationController)
        
        tabBarController.viewControllers = [testNavigationController, favoritesNavigationController, learnNavigationController, trashNavigationController, moreNavigationController]

        tabBarController.modalPresentationStyle = .fullScreen
        navigationController.present(tabBarController, animated: false, completion: nil)
        
        coordinate(to: testCoordinator)
        coordinate(to: favoritesCoordinator)
        coordinate(to: learnCoordinator)
        coordinate(to: trashCoordinator)
        coordinate(to: moreCoordinator)
    }
    
}
