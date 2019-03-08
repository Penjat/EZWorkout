//
//  StaticDataManager.swift
//  EZWorkout
//
//  Created by Yilei Huang on 2019-03-07.
//  Copyright © 2019 Spencer Symington. All rights reserved.
//

import Foundation

class StaticDataManager{
    
    enum checkType {
        case numberOfTimes, type, weight
    }
   
    static func getRealmData(type:checkType)->[String:Int]{
        var emptyDict = [String:Int]()
        if(type == .numberOfTimes){
            let results = UserRealm.curUser.getAllExercises()
           
            for item in results{
                
                if emptyDict.index(forKey: item.name!) == nil {
                    emptyDict[item.name!] = 1
                } else{
                    let num = emptyDict[item.name!]
                    emptyDict.updateValue(num!+1, forKey: item.name!)
                }
            }
        }else if type == .type{
            let results = UserRealm.curUser.getAllExercises()
            for item in results{
                if(item.type == nil){
                    
                }else{
                    if emptyDict.index(forKey: item.type) == nil {
                        emptyDict[item.type] = 1
                    } else{
                        let num = emptyDict[item.type]
                        emptyDict.updateValue(num!+1, forKey: item.type)
                    }
                }
               
            }
        }
        return emptyDict
        
    }
    
    
    static func sortRealmDict(Dict:[String:Int])->[(String,Int)]{
        
        var emptyDict = [String:Int]()
        for newItem in Dict{
            if emptyDict.count < 7 {
                print("the count is \(emptyDict.count) adding \(newItem.key)")
                emptyDict[newItem.key] = newItem.value
            }else{
                for oldItem in emptyDict{
                    if(newItem.value > oldItem.value){
                        emptyDict.removeValue(forKey: oldItem.key)
                        emptyDict[newItem.key] = newItem.value
                        break
                    }
                }
            }
        }
        
        
        return emptyDict.sorted(by: {$0.value > $1.value})
    }
    
    
}
