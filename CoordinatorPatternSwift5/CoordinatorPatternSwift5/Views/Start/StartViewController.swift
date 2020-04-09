//
//  StartViewController.swift
//  CoordinatorPatternSwift5
//
//  Created by Daniel Gx on 02/04/20.
//  Copyright © 2020 Daniel Gx. All rights reserved.
//

import UIKit

class StartViewController: UIViewController {
    
    // MARK: - Variables
    
    var coordinator: StartFlow?
    let startButon: UIButton = {
        let button = UIButton()
        button.setTitle("Start!", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = UIColor.systemPink
        button.layer.cornerRadius = 10
        button.layer.shadowRadius = 5
        button.layer.shadowColor = UIColor.systemTeal.cgColor
        button.layer.shadowOpacity = 1.0
        button.layer.shadowOffset = CGSize(width: -1, height: 3)
        button.addTarget(self, action: #selector(startTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    // MARK: - Actions
    
    @objc func startTapped() {
        coordinator?.coordinateToTabBar()
    }
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: false)
        tabBarController?.tabBar.isHidden = true
    }
}

// MARK: - UI Setup

extension StartViewController {
    
    private func setupUI() {
        if #available(iOS 13.0, *) {
            overrideUserInterfaceStyle = .light
        }
        
        self.view.backgroundColor = .white
        self.view.addSubview(startButon)
        
        NSLayoutConstraint.activate([
            startButon.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width / 3), startButon.heightAnchor.constraint(equalToConstant: 50), startButon.centerXAnchor.constraint(equalTo: self.view.centerXAnchor), startButon.centerYAnchor.constraint(equalTo: self.view.centerYAnchor)
                                    ])
    }
}
