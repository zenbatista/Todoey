//
//  Data.swift
//  Todoey
//
//  Created by Harald Batista on 1/22/18.
//  Copyright © 2018 zenbatista. All rights reserved.
//

import Foundation
import RealmSwift

class Data: Object {
    
    @objc dynamic var name: String = ""
    @objc dynamic var age: Int = 0
}
