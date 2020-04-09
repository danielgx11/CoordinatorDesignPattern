//
//  AppCoordinator.swift
//  CoordinatorTest
//
//  Created by Daniel Gx on 08/04/20.
//  Copyright © 2020 Daniel Gx. All rights reserved.
//

import UIKit

class AppCoordinator: Coordinator {
    let window: UIWindow
    
    init(window: UIWindow) {
        self.window = window
    }
    
    func start() {
        let navigationController = UINavigationController()
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
        
        let startCoordinator = StartCoordinator(navigationController: navigationController)
        coordinate(to: startCoordinator)
    }
}
