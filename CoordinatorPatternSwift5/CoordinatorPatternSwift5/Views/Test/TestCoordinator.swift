//
//  TestCoordinator.swift
//  CoordinatorPatternSwift5
//
//  Created by Daniel Gx on 02/04/20.
//  Copyright © 2020 Daniel Gx. All rights reserved.
//

import UIKit

protocol TestFlow: class {
    func coordinateToDetail()
    func coordinateToExit()
}

class TestCoordinator: Coordinator, TestFlow {
    
    // MARK: - Properties
    
    let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let testViewController = TestViewController()
        testViewController.coordinator = self
        navigationController.pushViewController(testViewController, animated: true)
    }
    
    // MARK: - Flow Methods
    
    func coordinateToDetail() {
        let testDetailCoordinator = TestDetailCoordinator(navigationController: navigationController)
        coordinate(to: testDetailCoordinator)
    }
    
    func coordinateToExit() {
        let startCoordinator = StartCoordinator(navigationController: navigationController)
        coordinate(to: startCoordinator)
    }
}
