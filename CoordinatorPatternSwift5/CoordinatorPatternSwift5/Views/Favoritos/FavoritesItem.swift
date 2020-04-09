//
//  FavoritesItem.swift
//  CoordinatorPatternSwift5
//
//  Created by Daniel Gx on 02/04/20.
//  Copyright © 2020 Daniel Gx. All rights reserved.
//

import UIKit

struct FavoriteItem {
    var title: String
}

class FavoriteItems {
    static let sharedInstance = FavoriteItems()
    var array = [String]()
}

class TrashItems {
    static let sharedInstance = TrashItems()
    var array = [String]()
}
