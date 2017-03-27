//
//  AppDelegate.swift
//  meettheteam
//
//  Created by apple on 03/03/17.
//  Copyright © 2017 apple. All rights reserved.
//

import Foundation

class GlobalSingleton {
    struct Static {
        static var instance: GlobalSingleton?
        static var token: dispatch_once_t = 0
    }
    class var sharedInstance: GlobalSingleton {
        dispatch_once(&Static.token) {
            Static.instance = GlobalSingleton()
        }
        return Static.instance!
    }
}