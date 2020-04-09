//
//  StartCoordinator.swift
//  CoordinatorTest
//
//  Created by Daniel Gx on 08/04/20.
//  Copyright © 2020 Daniel Gx. All rights reserved.
//

import UIKit

protocol StartFlow {
    func goToDetail()
}

class StartCoordinator: Coordinator, StartFlow {
    
    let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let startViewController = StartViewController.initFromStoryboard(name: "Main")
        startViewController.coordinator = self
        navigationController.pushViewController(startViewController, animated: true)
    }
    
    func goToDetail() {
        //
    }
}
