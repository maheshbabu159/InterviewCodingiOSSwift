//
//  ViewController.swift
//  BabyNamer
//
//  Created by Matt Bonness on 1/24/17.
//  Copyright © 2017 Motorola Solutions Inc. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    // TODO - connect views to outlets
    @IBOutlet weak var noNameImage: UIImage?
    @IBOutlet weak var nameLabel: UILabel?
    @IBOutlet weak var genderSegmentedControl: UISegmentedControl?
    let babyNameFactory = BabyNameFactory()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // code here to hide nameLabel
        updateNameValues()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    @IBAction func genderSegmentValueChanged(_ sender: Any) {
        updateNameValues()
    }
    
    // TODO - connect button to action
    @IBAction func buttonClicked(_ sender: UIButton) {
       updateNameValues()
    }
    
    //Change the name implementation
    func updateNameValues(){
     
        if let babyNameObject = babyNameFactory.generateNameForGender(aGender: Gender(rawValue: (genderSegmentedControl?.selectedSegmentIndex)!)!){
            nameLabel?.text = "\(babyNameObject.name!)"
            
        }else{
            nameLabel?.text = "Unknown"
        }
        
    }
}

