//
//  MoreDetailCoordinator.swift
//  CoordinatorPatternSwift5
//
//  Created by Daniel Gx on 06/04/20.
//  Copyright © 2020 Daniel Gx. All rights reserved.
//

import UIKit

protocol MoreDetailFlow {
    func dismissDetail()
}

class MoreDetailCoordinator: Coordinator, MoreDetailFlow {
    
    // MARK: - Properties
    
    let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let moreDetailViewController = MoreDetailViewController()
        moreDetailViewController.coordinator = self
        navigationController.present(moreDetailViewController, animated: true, completion: nil)
    }
    
    // MARK: - Flow Methods
    
    func dismissDetail() {
        navigationController.dismiss(animated: true, completion: nil)
    }
}
