//
//  TrashCoordinator.swift
//  CoordinatorPatternSwift5
//
//  Created by Daniel Gx on 06/04/20.
//  Copyright © 2020 Daniel Gx. All rights reserved.
//

import UIKit

protocol TrashFlow: class {
    func coordinateToDetail()
}

class TrashCoordinator: Coordinator, TrashFlow {
    
    // MARK: - Properties
    
    let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let trashTableView = TrashTableView()
        trashTableView.coordinator = self
        navigationController.pushViewController(trashTableView, animated: false)
    }
    
    // MARK: - Flow Methods
    
    func coordinateToDetail() {
        //
    }
}
