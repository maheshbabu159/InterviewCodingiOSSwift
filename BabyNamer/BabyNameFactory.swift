//
//  BabyNameFactory.swift
//  BabyNamer
//
//  Created by Matt Bonness on 1/24/17.
//  Copyright © 2017 Motorola Solutions Inc. All rights reserved.
//

import Foundation

class BabyNameFactory {
    var babyNamesArray = [BabyName]()
    init() {
        babyNamesArray.append(BabyName(name: "Arya", gender: .Female))
        babyNamesArray.append(BabyName(name: "Bronn", gender: .Male))
        babyNamesArray.append(BabyName(name: "Cersei", gender: .Female))
        babyNamesArray.append(BabyName(name: "Daenerys", gender: .Female))
        babyNamesArray.append(BabyName(name: "Hodor", gender: .Male))
        babyNamesArray.append(BabyName(name: "Jaime", gender: .Female))
        babyNamesArray.append(BabyName(name: "Jon", gender: .Male))
        babyNamesArray.append(BabyName(name: "Tyrion", gender: .Male))
        babyNamesArray.append(BabyName(name: "Ygritte", gender: .Female))
    }
    
    func generateNameForGender(aGender: Gender) -> BabyName? {
        
        // TODO: randomly select a name from babyNames for passed in gender and return it to the caller
        let seletedGenderArray = babyNamesArray.filter( { return $0.gender == aGender} )
        var babyNameObject:BabyName?
        if seletedGenderArray.isEmpty {
            babyNameObject = nil
        }else{
            let randomNum:UInt32 = arc4random_uniform(UInt32(seletedGenderArray.count))
            // convert the UInt32 to some other  types
            let index:TimeInterval = TimeInterval(randomNum)
            babyNameObject =  seletedGenderArray[Int(index)]
        
        }
        return babyNameObject
    }
}

