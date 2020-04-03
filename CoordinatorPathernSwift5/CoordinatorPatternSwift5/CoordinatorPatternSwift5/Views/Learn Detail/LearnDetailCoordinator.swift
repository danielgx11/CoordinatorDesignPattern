//
//  LearnDetailCoordinator.swift
//  CoordinatorPatternSwift5
//
//  Created by Daniel Gx on 03/04/20.
//  Copyright © 2020 Daniel Gx. All rights reserved.
//

import UIKit

protocol LearnDetailFlow {
    func dismissDetail()
}

class LearnDetailCoordinator: Coordinator, LearnDetailFlow {
    
    // MARK: - Properties
    
    let navigationController: UINavigationController
    let learnItemTitle: String
    let learnItemLevel: String
    
    init(navigationController: UINavigationController, learnItemTitle: String, learnItemLevel: String) {
        self.navigationController = navigationController
        self.learnItemTitle = learnItemTitle
        self.learnItemLevel = learnItemLevel
    }
        
    func start() {
        let learnDetailViewController = LearnDetailViewController()
        learnDetailViewController.learnItemTitle = learnItemTitle
        learnDetailViewController.learnItemLevel = learnItemLevel
        learnDetailViewController.coordinator = self
        navigationController.present(learnDetailViewController, animated: true, completion: nil)
    }
    
    // MARK: - Flow Methods
    
    func dismissDetail() {
        navigationController.dismiss(animated: true, completion: nil)
    }
}
