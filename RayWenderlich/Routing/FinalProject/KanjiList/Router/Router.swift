//
//  Router.swift
//  KanjiList
//
//  Created by Teacher on 3/10/19.
//  Copyright © 2019 Kolos. All rights reserved.
//

import UIKit


protocol Router {
  
  var navigationController: UINavigationController { get }
  var rootViewController: UIViewController? { get }
  func present(_ module: Showable, animated: Bool)
  func push(_ module: Showable, animated: Bool, completion: (() -> Void)?)
  func pop(animated: Bool)
  
}
