//
//  DetailsViewController.swift
//  meettheteam
//
//  Created by apple on 03/03/17.
//  Copyright © 2017 apple. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {
    
    //MARK: Properties
    let nameLable = UILabel()
    let titleLable = UILabel()
    let imageView = UIImageView()
    let bioDataTextView = UITextView()
    var objectsArray:[Team]!
    var currentIndex:Int!
    
    enum ButtonTagsEnum:Int {
        case Back = 2000
        case Next
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        imageView.backgroundColor = UIColor.whiteColor()
        self.view.backgroundColor = UIColor.whiteColor()
       
        setControlValues(objectsArray[currentIndex] as Team)
        addConstraints()
    }
    
    func setControlValues(detailsObject: Team){
        
        self.title = "\(detailsObject.firstName) \(detailsObject.lastName)"
        nameLable.text = "\(detailsObject.firstName) \(detailsObject.lastName)"
        titleLable.text = "\(detailsObject.title)"
        bioDataTextView.text = detailsObject.bio
        imageView.sd_setImageWithURL(NSURL(string: detailsObject.avatar))

    }
 
    func addConstraints(){
        
        //Image and other details stack view
        let topRightStackView = UIStackView(arrangedSubviews: [nameLable,titleLable])
        topRightStackView.axis = .Vertical
        topRightStackView.distribution = .FillProportionally
        topRightStackView.alignment = .FirstBaseline
        topRightStackView.spacing = 0
    
        //Arrow buttons
        let backArrowButton = UIButton(type: .Custom) // let preferred over var here
        backArrowButton.backgroundColor = GlobalSettings.hexStringToUIColor(GlobalVariables.appColor)
        backArrowButton.layer.cornerRadius = 8
        backArrowButton.setTitle("Back", forState: UIControlState.Normal)
        backArrowButton.tag = ButtonTagsEnum.Back.rawValue
        backArrowButton.addTarget(self, action: #selector(DetailsViewController.buttonClick(_:)), forControlEvents: UIControlEvents.TouchUpInside)
        
        let nextArrowButton = UIButton(type: .Custom) // let preferred over var here
        nextArrowButton.backgroundColor = GlobalSettings.hexStringToUIColor(GlobalVariables.appColor)
        nextArrowButton.layer.cornerRadius = 8
        nextArrowButton.setTitle("Next", forState: UIControlState.Normal)
        nextArrowButton.tag = ButtonTagsEnum.Next.rawValue
        nextArrowButton.addTarget(self, action: #selector(DetailsViewController.buttonClick(_:)), forControlEvents: UIControlEvents.TouchUpInside)
        
        
        //Stack views
        let topStackView = UIStackView(arrangedSubviews: [imageView,topRightStackView])
        topStackView.axis = .Horizontal
        topStackView.distribution = .FillEqually
        topStackView.alignment = .Fill
        topStackView.spacing = 10
        topStackView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(topStackView)
        
        //Bio data stack view
        let centerStackView = UIStackView(arrangedSubviews: [bioDataTextView])
        centerStackView.axis = .Horizontal
        centerStackView.distribution = .FillEqually
        centerStackView.alignment = .Fill
        centerStackView.spacing = 10
        centerStackView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(centerStackView)
        
        //Bio data stack view
        let botomStackView = UIStackView(arrangedSubviews: [backArrowButton,nextArrowButton])
        botomStackView.axis = .Horizontal
        botomStackView.distribution = .FillEqually
        botomStackView.alignment = .Fill
        botomStackView.spacing = 10
        botomStackView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(botomStackView)


        //Adding constraints using visual format language
        let viewsDictionary = ["topStackView":topStackView,"botomStackView":botomStackView,"centerStackView":centerStackView]
        let topStackViewHorizantalContraints = NSLayoutConstraint.constraintsWithVisualFormat(
            "H:|-20-[topStackView]-20-|",  //horizontal constraint 20 points from left and right side
            options: NSLayoutFormatOptions(rawValue: 0),
            metrics: nil,
            views: viewsDictionary)
        let topStackViewVerticalContraints = NSLayoutConstraint.constraintsWithVisualFormat(
            "V:|-84-[topStackView(==100)]-20-[centerStackView]-20-[botomStackView]-20-|", //vertical constraint 30 points from top and bottom
            options: NSLayoutFormatOptions(rawValue:0),
            metrics: nil,
            views: viewsDictionary)
        let centerStackViewHorizantalContraint = NSLayoutConstraint.constraintsWithVisualFormat(
            "H:|-20-[centerStackView]-20-|",  //horizontal constraint 20 points from left and right side
            options: NSLayoutFormatOptions(rawValue: 0),
            metrics: nil,
            views: viewsDictionary)
        
        let bottomStackViewHorizantalContraint = NSLayoutConstraint.constraintsWithVisualFormat(
            "H:|-20-[botomStackView]-20-|",  //horizontal constraint 20 points from left and right side
            options: NSLayoutFormatOptions(rawValue: 0),
            metrics: nil,
            views: viewsDictionary)
        
        view.addConstraints(centerStackViewHorizantalContraint)
        view.addConstraints(bottomStackViewHorizantalContraint)
        view.addConstraints(topStackViewHorizantalContraints)
        view.addConstraints(topStackViewVerticalContraints)


    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func buttonClick(sender:AnyObject){
        let button:UIButton = sender as! UIButton
        
        switch button.tag {
        case ButtonTagsEnum.Back.rawValue:
            currentIndex = currentIndex - 1
            guard let index = currentIndex where currentIndex > 0 else{
                currentIndex = 0
                return
            }
            setControlValues(objectsArray[index] as Team)

            break
        default:
            currentIndex = currentIndex + 1
            guard let index = currentIndex where currentIndex < objectsArray.count-1 else{
                currentIndex = objectsArray.count-1
                return
            }
            setControlValues(objectsArray[index] as Team)

            break
        }

    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
