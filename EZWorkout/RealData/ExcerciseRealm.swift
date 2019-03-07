

import UIKit
import RealmSwift

class ExcerciseRealm: Object {
    @objc dynamic var calory = 0
    let weight = RealmOptional<Int>()
    @objc dynamic var type: String!
    @objc dynamic var name: String!
    @objc dynamic var modified: String!
    @objc dynamic var reps = 0
    
   
}
