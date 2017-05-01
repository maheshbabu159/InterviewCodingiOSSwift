//
//  AppDelegate.swift
//  NewExercises
//
//  Created by apple on 07/04/17.
//  Copyright © 2017 apple. All rights reserved.
//

import UIKit
private extension String {
    subscript (index: Int) -> Character {
        return self[self.characters.index(self.startIndex, offsetBy: index)]
    }
}
@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        //self.workingWithDataStructers()
        return true
    }
   
    
    func workingWithDataStructers(){
        
        //Bubble Sort
        //AppDelegate.bubbleSort()
        //AppDelegate.getSmallAndGreatestNumber()
        
        //Binary Search - Divide and Conquer
        //let numbers = [2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 47, 53, 59, 61, 67]
        //print(AppDelegate.binarySearch(numbers, key: 43, range: 0 ..< numbers.count) ?? 0 ) // gives 13
        
        // Override point for customization after application launch.
        //Approach 2
        /*let numbersArray = [1, 2, 5,7, 9 ,23, 21, 65, 32, 76, 24, 43, 26]
         let resultIndices = AppDelegate.getIndices(array: numbersArray,targetValue: 100)
         print(resultIndices ?? [Int]())*/
        
        /*let length = AppDelegate.getUniqueCharatersLength(inputString: "asfasfasgsggshfhghjsfga")
         print(length)*/
        
        //Finding a single element from sorted a arrays
        /*let numbersArray = [1, 1, 2,2, 4,4, 5,5, 6,6, 7, 7, 8]
         let result = AppDelegate.getSingleNumberFromSortedArray(array: numbersArray)
         print(result)*/
        
        /*let numbersArray = [1, 1, 2,2, 4,4, 5,5, 6,6, 7, 7, 8]
         let result = AppDelegate.findAnItemFromSortedArray(array: numbersArray,targetValue: 8)
         print(result)*/
        
        /*let numbersArray = [1, 2, 3 , 4 ,5]
         let resultIndices = AppDelegate.getAllSubsets(array: numbersArray,targetValue: 6)
         print(resultIndices )*/
        
        /*let result = AppDelegate.stringIsAnagram(string1:"hello", string2: "oellh")
         print(result )
         let result = AppDelegate.polynodryme(number: 545)
         print(result)*/
        let result = DataStructers.isValid("{}afasf(")
        print(result)

        
    }
    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

