//
//  FavoritesViewController.swift
//  CoordinatorPatternSwift5
//
//  Created by Daniel Gx on 02/04/20.
//  Copyright © 2020 Daniel Gx. All rights reserved.
//

import UIKit

class FavoritesTableView: UIViewController {
    
    // MARK: - Properties
    
    var coordinator: FavoritesFlow?
    var favoriteItems: [FavoriteItem] = [.init(title: "Lesson one"),
                                         .init(title: "Lesson two"),
                                         .init(title: "Lesson three"),
                                         .init(title: "Lesson four")]
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        tableView.delegate = self
        tableView.dataSource = self
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
        
    // MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        customizeNavigationController()
    }
    
    // MARK: - Methods
    
    func customizeNavigationController() {
        navigationItem.title = "Lessons"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
}

// MARK: - UITableView Delegate & Data Source

extension FavoritesTableView: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return favoriteItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")!
        cell.textLabel?.text = favoriteItems[indexPath.row].title
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        coordinator?.coordinateToDetail(favoriteItems[indexPath.row])
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}

// MARK: - UI Setup

extension FavoritesTableView {
    private func setupUI() {
        if #available(iOS 13.0, *) {
            overrideUserInterfaceStyle = .light
        }
        
        self.view.backgroundColor = .white
        self.view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.widthAnchor.constraint(equalTo: self.view.widthAnchor),
            tableView.heightAnchor.constraint(equalTo: self.view.heightAnchor)])
    }
}
