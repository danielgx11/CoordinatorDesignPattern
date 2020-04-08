//
//  LearnDetailViewController.swift
//  CoordinatorPatternSwift5
//
//  Created by Daniel Gx on 03/04/20.
//  Copyright © 2020 Daniel Gx. All rights reserved.
//

import UIKit

class LearnDetailViewController: UIViewController {
    
    // MARK: - Properties
    
    var coordinator: LearnDetailFlow?
    var learnItemTitle: String? {
        didSet {
            self.titleLabel.text = learnItemTitle
        }
    }
    var learnItemLevel: String? {
        didSet {
            self.levelLabel.text = learnItemLevel
        }
    }
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let levelLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let dismissDetailButton: UIButton = {
        let button = UIButton()
        button.setTitle("★ Favorite ★", for: .normal)
        button.setTitleColor(.darkGray, for: .normal)
        button.backgroundColor = UIColor.systemYellow
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
        if isPossible(learnItemTitle!) {
            FavoriteItems.sharedInstance.array.insert(learnItemTitle!, at: 0)
            coordinator?.dismissDetail()
        } else {
            let ac = UIAlertController(title: "Warning", message: "This item is already favorite!", preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
            present(ac, animated: true)
        }
    }
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    // MARK: - Methods
    
    func isPossible(_ item: String) -> Bool {
        if FavoriteItems.sharedInstance.array.contains(item) {
            return false
        }
        return true
    }

}

// MARK: - UI Setup

extension LearnDetailViewController {
    
    private func setupUI() {
        if #available(iOS 13.0, *) {
            overrideUserInterfaceStyle = .light
        }
        
        self.view.backgroundColor = .white
        self.view.addSubview(titleLabel)
        self.view.addSubview(levelLabel)
        self.view.addSubview(dismissDetailButton)
        
        NSLayoutConstraint.activate([titleLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
                                     titleLabel.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 20),
                                     levelLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
                                     levelLabel.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 40),
        
                                     dismissDetailButton.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width / 3),
                                     dismissDetailButton.heightAnchor.constraint(equalToConstant: 50),
                                     dismissDetailButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
                                     dismissDetailButton.centerYAnchor.constraint(equalTo: self.view.centerYAnchor)
                                    ])
    }
}
