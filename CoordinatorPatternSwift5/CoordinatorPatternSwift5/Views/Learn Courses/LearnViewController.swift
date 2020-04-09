//
//  LearnViewController.swift
//  CoordinatorPatternSwift5
//
//  Created by Daniel Gx on 03/04/20.
//  Copyright © 2020 Daniel Gx. All rights reserved.
//

import UIKit

class LearnViewController: UIViewController {
    
    // MARK: - Properties
    
    var coordinator: LearnFlow?
    let learnItems: [LearnItem] = [ .init(title: "Swift", level: "Professional"),
                                    .init(title: "JavaScript", level: "Professional"),
                                    .init(title: "Kotlin", level: "Professional"),
                                    .init(title: "Python", level: "Intermediate"),
                                    .init(title: "Ruby", level: "Intermediate"),
                                    .init(title: "C", level: "Intermediate"),
                                    .init(title: "C++", level: "Intermediate"),
                                    .init(title: "PHP", level: "Intermediate"),
                                    .init(title: "HTML", level: "Intermediate"),
                                    .init(title: "CSS", level: "Beginner"),
                                    .init(title: "C#", level: "Beginner"),
                                    .init(title: "Java", level: "Beginner"),
                                    .init(title: "GO", level: "Beginner")]
    
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
}

// MARK: - UI Setup

extension LearnViewController {
    
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
    
    func customizeNavigationController() {
        navigationItem.title = "Let's learn?"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
}

// MARK: - UITableView Delegate & DataSource

extension LearnViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return learnItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")!
        cell.textLabel?.text = learnItems[indexPath.row].title
        cell.detailTextLabel?.text = learnItems[indexPath.row].level
        
        cell.accessoryType = UITableViewCell.AccessoryType.disclosureIndicator
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        coordinator?.coordinateToDetail(learnItems[indexPath.row].title, level: learnItems[indexPath.row].level)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        guard editingStyle == UITableViewCell.EditingStyle.delete else { return }
        TrashItems.sharedInstance.array.insert(learnItems[indexPath.row].title , at: 0)
    }
}

