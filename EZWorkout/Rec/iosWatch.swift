//
//  iosWatch.swift
//  EZWorkout
//
//  Created by Yilei Huang on 2019-03-12.
//  Copyright © 2019 Spencer Symington. All rights reserved.
//

import Foundation

class iosWatch{
    static var delegate : RecognizerReturnDelegate?
    static func getOutputFromWatch(inputStr: String)->String{
        delegate?.recieve(speech: inputStr)
        return inputStr
    }
}
