//
//  LearnCoordinator.swift
//  CoordinatorPatternSwift5
//
//  Created by Daniel Gx on 03/04/20.
//  Copyright © 2020 Daniel Gx. All rights reserved.
//

import UIKit

protocol LearnFlow {
    func coordinateToDetail(_ title: String, level: String)
}

class LearnCoordinator: Coordinator, LearnFlow {
    
    // MARK: - Properties
    
    let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let learnViewController = LearnViewController()
        learnViewController.coordinator = self
        navigationController.pushViewController(learnViewController, animated: false)
    }
    
    // MARK: - Flow Methods
    
    func coordinateToDetail(_ title: String, level: String) {
        let learnDetailCoordinator = LearnDetailCoordinator(navigationController: navigationController, learnItemTitle: title, learnItemLevel: level)
        coordinate(to: learnDetailCoordinator)
    }
}
