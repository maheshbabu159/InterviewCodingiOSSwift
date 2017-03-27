//
//  BabyName.swift
//  BabyNamer
//
//  Created by Matt Bonness on 1/24/17.
//  Copyright © 2017 Motorola Solutions Inc. All rights reserved.
//

import Foundation

class BabyName {
    var name: String?
    var gender: Gender?
    
    init (name: String, gender: Gender) {
        self.name = name
        self.gender = gender
    }
    
    func getName() -> String? {
        return self.name
    }
    
    func getGender() -> Gender? {
        return self.gender
    }
}
