//
//  StartCoordinator.swift
//  CoordinatorPatternSwift5
//
//  Created by Daniel Gx on 02/04/20.
//  Copyright © 2020 Daniel Gx. All rights reserved.
//

import UIKit

protocol StartFlow: class {
    func coordinateToTabBar()
}

class StartCoordinator: Coordinator, StartFlow {
    let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let startViewController = StartViewController()
        startViewController.coordinator = self
        navigationController.pushViewController(startViewController, animated: false)
    }
    
    // MARK: - Flow Methods
    
    func coordinateToTabBar() {
        let tabBarCoordinator = TabBarCoordinator(navigationController: navigationController)
        coordinate(to: tabBarCoordinator)
    }
}
