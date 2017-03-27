//
//  Team.swift
//  meettheteam
//
//  Created by apple on 03/03/17.
//  Copyright © 2017 apple. All rights reserved.
//

import UIKit

struct Team {
    let id : String
    let lastName : String
    let firstName : String
    let title : String
    let bio : String
    let avatar : String
    
    init(dictionary:[String:AnyObject]){
        if let value = dictionary["id"] as? String{
            self.id = value
        }else{
            self.id =  ""
        }
        if let value = dictionary["lastName"] as? String{
            self.lastName = value
        }else{
            self.lastName =  ""
        }
        if let value = dictionary["firstName"] as? String{
            self.firstName = value
        }else{
            self.firstName =  ""
        }
        if let value = dictionary["title"] as? String{
            self.title = value
        }else{
            self.title =  ""
        }
        if let value = dictionary["bio"] as? String{
            self.bio = value
        }else{
            self.bio =  ""
        }
        if let value = dictionary["avatar"] as? String{
            self.avatar = value
        }else{
            self.avatar =  ""
        }
    }
}