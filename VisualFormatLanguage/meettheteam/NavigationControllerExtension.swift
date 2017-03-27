//
//  NavigationControllerExtension.swift
//  meettheteam
//
//  Created by apple on 04/03/17.
//  Copyright © 2017 apple. All rights reserved.
//

import UIKit
extension UINavigationController {
    func setDefaults(){
        //Navigation bar settings
        let navbarFont = UIFont(name: "Ubuntu", size: 17) ?? UIFont.systemFontOfSize(17)
        //let barbuttonFont = UIFont(name: "Ubuntu-Light", size: 15) ?? UIFont.systemFontOfSize(15)
        
        UINavigationBar.appearance().titleTextAttributes = [NSFontAttributeName: navbarFont, NSForegroundColorAttributeName:UIColor.whiteColor()]
        
        UINavigationBar.appearance().barTintColor = GlobalSettings.hexStringToUIColor(GlobalVariables.appColor)
        UINavigationBar.appearance().tintColor = UIColor.whiteColor()

    }
}