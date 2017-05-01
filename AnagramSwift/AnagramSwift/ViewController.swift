//
//  ViewController.swift
//  Anagram
//
//  Created by apple on 27/03/17.
//  Copyright © 2017 apple. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var secondStringTextFiled: UITextField!
    @IBOutlet var firstStringTextFiled: UITextField!
    @IBOutlet var resultLable: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
    }
    func stringIsAnagram(_ str1: String, str2 : String) -> Bool {
        
        var dict1 = [Character: Int]()
        var dict2 = [Character: Int]()
        
        let count = 0
    
        for char in str1.characters {
            if (dict1[char] != nil) {
                dict1[char] = count + 1
            } else {
                dict1[char] = count
            }
        }
        
        for char in str2.characters {
            if (dict2[char] != nil) {
                dict2[char] = count + 1
            } else {
                dict2[char] = count
            }
        }
        
        if dict1 == dict2 {
            return true
        }
        return false
        
    }
    
    @IBAction func anagramButtonClick(_ sender: AnyObject) {
        
        guard firstStringTextFiled.text?.characters.count != 0 else{
            return
        }
        
        guard secondStringTextFiled.text?.characters.count != 0 else{
            return
        }
        
        if stringIsAnagram(firstStringTextFiled.text!, str2: secondStringTextFiled.text!){
            resultLable.text = "True"
        }else{
            resultLable.text = "False"
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

