//
//  TrashTableView.swift
//  CoordinatorPatternSwift5
//
//  Created by Daniel Gx on 06/04/20.
//  Copyright © 2020 Daniel Gx. All rights reserved.
//

import UIKit

class TrashTableView: UIViewController {
    
    // MARK: - Properties
    
    var coordinator: TrashFlow?
    let trashItems: [LearnItem] = []
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        tableView.delegate = self
        tableView.dataSource = self
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()

    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        customizeNavigationController()
    }
    
    // MARK: - Methods
    
    func customizeNavigationController() {
        title = "Trash"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
}

// MARK: - TableView Delegate & DataSource

extension TrashTableView: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return trashItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")!
        cell.textLabel?.text = trashItems[indexPath.row].title
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        //TODO: - Trash Details
    }
}

// MARK: - UI Setup

extension TrashTableView {
    private func setupUI() {
        if #available(iOS 13.0, *) {
            overrideUserInterfaceStyle = .light
        }
        
        self.view.backgroundColor = .white
        self.view.addSubview(tableView)
        
        NSLayoutConstraint.activate([tableView.widthAnchor.constraint(equalTo: self.view.widthAnchor),
                                     tableView.heightAnchor.constraint(equalTo: self.view.heightAnchor)
                                    ])
    }
}
