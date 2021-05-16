//
//  Item.swift
//  TodoRealm
//
//  Created by クワシマ・ユウキ on 2020/09/21.
//  Copyright © 2020 クワシマ・ユウキ. All rights reserved.
//

import Foundation
import RealmSwift

class Item: Object {
    @objc dynamic var title: String?
    @objc dynamic var date: Date?
}
