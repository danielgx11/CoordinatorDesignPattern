//
//  FavoritesViewController.swift
//  CoordinatorPatternSwift5
//
//  Created by Daniel Gx on 02/04/20.
//  Copyright © 2020 Daniel Gx. All rights reserved.
//

import UIKit

class FavoritesDetailViewController: UIViewController {
    
    // MARK: - Properties
    
    var coordinator: FavoritesDetailFlow?
    var favoriteItemTitle: FavoriteItem? {
        didSet {
            self.titleLabel.text = favoriteItemTitle?.title
        }
    }
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .systemPink
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let dismissDetailButton: UIButton = {
        let button = UIButton()
        button.setTitle("Dismiss Detail", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = UIColor.systemGray
        button.layer.cornerRadius = 10
        button.layer.shadowRadius = 5
        button.layer.shadowColor = UIColor.gray.cgColor
        button.layer.shadowOpacity = 1.0
        button.layer.shadowOffset = CGSize(width: -1, height: 3)
        button.addTarget(self, action: #selector(dismissDetailTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()

    
    // MARK: - Actions
    
    @objc func dismissDetailTapped() {
        coordinator?.dismissDetail()
    }
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
}

// MARK: - UI Setup

extension FavoritesDetailViewController {
    private func setupUI() {
        if #available(iOS 13.0, *) {
            overrideUserInterfaceStyle = .light
        }
        
        self.view.backgroundColor = .white
        self.view.addSubview(titleLabel)
        self.view.addSubview(dismissDetailButton)
        
        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            titleLabel.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
        
            dismissDetailButton.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width / 3 ),
            dismissDetailButton.heightAnchor.constraint(equalToConstant: 50),
            dismissDetailButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            dismissDetailButton.centerYAnchor.constraint(equalTo: self.view.centerYAnchor)
        ])
    }
}
