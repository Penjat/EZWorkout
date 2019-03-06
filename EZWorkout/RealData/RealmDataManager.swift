//
//  RealmDataManager.swift
//  EZWorkout
//
//  Created by Yilei Huang on 2019-03-05.
//  Copyright © 2019 Spencer Symington. All rights reserved.
//

import Foundation
import UIKit
import RealmSwift


class RealmDataManger: UIViewController{
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        var config = Realm.Configuration()
        config.schemaVersion = 20
        let realm = try! Realm(configuration: config)
        
       
        let firstExcercise = ExcerciseRealm(value:[20,"BodyWeight","pushUp",5])
        let firstWorkout = WorkoutRealm(value:[Date(),Date(),"Vancouver",[firstExcercise]])
        let firstUserStat = userStatRealm(value:[Date(),120])
        let firstUser = UserRealm(value:["Josh","Male",Date(),[firstUserStat],[firstWorkout]])
        
        
        try! realm.write {
            realm.add(firstUser)
        }
         print(Realm.Configuration.defaultConfiguration.fileURL)
//        DispatchQueue(label: "background").async {
//            autoreleasepool {
//                let realm = try! Realm()
//                let theDog = realm.objects(Cats.self).filter("name == 'Josh'").first
//                try! realm.write {
//                    theDog!.name = "jack"
//                }
//            }
//        }
        
    }
    
    
}
