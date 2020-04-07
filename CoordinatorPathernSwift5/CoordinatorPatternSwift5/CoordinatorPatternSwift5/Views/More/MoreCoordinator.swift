//
//  MoreCoordinator.swift
//  CoordinatorPatternSwift5
//
//  Created by Daniel Gx on 06/04/20.
//  Copyright © 2020 Daniel Gx. All rights reserved.
//

import UIKit

protocol MoreFlow: class {
    func goToDetail()
}

class MoreCoordinator: Coordinator, MoreFlow {
    
    // MARK: - Properties
    
    let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let moreViewController = MoreViewController()
        moreViewController.coordinator = self
        navigationController.pushViewController(moreViewController, animated: false)
    }
    
    // MARK: - Flow Methods
    
    func goToDetail() {
        let moreDetailCoordinator = MoreDetailCoordinator(navigationController: navigationController)
        coordinate(to: moreDetailCoordinator)
    }
}
