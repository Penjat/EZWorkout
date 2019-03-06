//
//  userStatRealm.swift
//  EZWorkout
//
//  Created by Yilei Huang on 2019-03-05.
//  Copyright © 2019 Spencer Symington. All rights reserved.
//

import UIKit
import RealmSwift

class userStatRealm: Object {
    @objc dynamic var date: Date?
    @objc dynamic var weight = 0
}
