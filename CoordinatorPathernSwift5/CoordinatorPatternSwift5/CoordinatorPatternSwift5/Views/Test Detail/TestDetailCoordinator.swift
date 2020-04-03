//
//  TestDetailCoordinator.swift
//  CoordinatorPatternSwift5
//
//  Created by Daniel Gx on 02/04/20.
//  Copyright © 2020 Daniel Gx. All rights reserved.
//

import UIKit

protocol TestDetailFlow {
    func dismissDetail()
}

class TestDetailCoordinator: Coordinator, TestDetailFlow {
    
    // MARK: - Properties
    
    let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let testDetailViewController = TestDetailViewController()
        testDetailViewController.coordinator = self
        navigationController.present(testDetailViewController, animated: true, completion: nil)
    }
    
    // MARK: - Flow Methods
    
    func dismissDetail() {
        navigationController.dismiss(animated: true, completion: nil)
    }
}
