//
//  TestViewController.swift
//  CoordinatorPatternSwift5
//
//  Created by Daniel Gx on 02/04/20.
//  Copyright © 2020 Daniel Gx. All rights reserved.
//

import UIKit

class TestViewController: UIViewController {
    
    // MARK: - Properties
    
    var coordinator: TestFlow?
    let showDetailButton: UIButton = {
        let button = UIButton()
        button.setTitle("Show Detail", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = UIColor.systemPink
        button.layer.cornerRadius = 10
        button.layer.shadowRadius = 5
        button.layer.shadowColor = UIColor.purple.cgColor
        button.layer.shadowOpacity = 1.0
        button.layer.shadowOffset = CGSize(width: -1, height: 3)
        button.addTarget(self, action: #selector(showDetailTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    // MARK: - Actions
    
    @objc func showDetailTapped() {
        coordinator?.coordinateToDetail()
    }
    
    @objc func exitTapped() {
        coordinator?.coordinateToExit()
    }
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        customizeNavigationController()
    }
}

// MARK: - UI Setup

extension TestViewController {
    private func setupUI() {
        if #available(iOS 13.0, *) {
            overrideUserInterfaceStyle = .light
        }
        
        self.view.backgroundColor = .white
        self.view.addSubview(showDetailButton)
        
        NSLayoutConstraint.activate([
            showDetailButton.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width / 3),
            showDetailButton.heightAnchor.constraint(equalToConstant: 50),
            showDetailButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            showDetailButton.centerYAnchor.constraint(equalTo: self.view.centerYAnchor)
        ])
    }
    
    private func customizeNavigationController() {
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Exit", style: .done, target: self, action: #selector(exitTapped))
        navigationController?.navigationBar.tintColor = .black
    }
}
