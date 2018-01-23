//
//  Category.swift
//  Todoey
//
//  Created by Harald Batista on 1/22/18.
//  Copyright © 2018 zenbatista. All rights reserved.
//

import Foundation
import RealmSwift

class Category: Object {
    @objc dynamic var name : String = ""
    let items = List<Item>()

}
