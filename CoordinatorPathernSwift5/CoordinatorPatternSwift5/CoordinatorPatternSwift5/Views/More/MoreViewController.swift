//
//  MoreViewController.swift
//  CoordinatorPatternSwift5
//
//  Created by Daniel Gx on 06/04/20.
//  Copyright © 2020 Daniel Gx. All rights reserved.
//

import UIKit

class MoreViewController: UIViewController {
    
    // MARK: - Properties
    
    var coordinator: MoreFlow?
    let showDetailButton: UIButton = {
        let button = UIButton()
        button.setTitle("Show detail", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = UIColor.systemPink
        button.layer.cornerRadius = 10
        button.layer.shadowRadius = 5
        button.layer.shadowColor = UIColor.purple.cgColor
        button.layer.shadowOpacity = 1.0
        button.layer.shadowOffset = CGSize(width: -1, height: 3)
        button.addTarget(self, action: #selector(showDetailTapped(_:)), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    // MARK: - Actions
    
    @objc func showDetailTapped(_ sender: UIButton) {
        coordinator?.goToDetail()
    }
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
}

// MARK: - UI Setup

extension MoreViewController {
    private func setupUI() {
        if #available(iOS 13.0, *) {
            overrideUserInterfaceStyle = .light
        }
        
        self.view.backgroundColor = .white
        self.view.addSubview(showDetailButton)
        
        NSLayoutConstraint.activate([showDetailButton.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width / 3),
                                     showDetailButton.heightAnchor.constraint(equalToConstant: 50),
                                     showDetailButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
                                     showDetailButton.centerYAnchor.constraint(equalTo: self.view.centerYAnchor)
                                    ])
    }
}
