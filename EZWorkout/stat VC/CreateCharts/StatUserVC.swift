//
//  StatUserVC.swift
//  EZWorkout
//
//  Created by Yilei Huang on 2019-03-08.
//  Copyright © 2019 Spencer Symington. All rights reserved.
//

import UIKit
import UICircularProgressRing
import SkyFloatingLabelTextField
class StatUserVC: UIViewController, UITextFieldDelegate {

    
    @IBOutlet weak var heightField: SkyFloatingLabelTextFieldWithIcon!
    @IBOutlet weak var ageField: SkyFloatingLabelTextFieldWithIcon!
    @IBOutlet weak var caloryField: SkyFloatingLabelTextFieldWithIcon!
    @IBOutlet weak var weightField: SkyFloatingLabelTextFieldWithIcon!
    @IBOutlet weak var circularView: UICircularProgressRing!
    @IBOutlet weak var goalChoiceBar: UISegmentedControl!
    @IBOutlet weak var submitButton: UIButton!
    
    
    let lightGreyColor: UIColor = UIColor(red: 197 / 255, green: 205 / 255, blue: 205 / 255, alpha: 1.0)
    let darkGreyColor: UIColor = UIColor(red: 52 / 255, green: 42 / 255, blue: 61 / 255, alpha: 1.0)
    let overcastBlueColor: UIColor = UIColor(red: 0, green: 187 / 255, blue: 204 / 255, alpha: 1.0)
    var textFields = [SkyFloatingLabelTextFieldWithIcon]()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        circularView.backgroundColor = .black
        setUpText()
        setUpButton()
        textFields = [caloryField,heightField,weightField,ageField]
        for text in textFields{
            text.delegate = self
        }
        caloryField.becomeFirstResponder()
        
    }
    func textFieldDidEndEditing(_ textField: UITextField, reason: UITextField.DidEndEditingReason) {
        textField.resignFirstResponder()
    }
    
    @IBAction func submitButton(_ sender: Any) {
//        if caloryField.text != nil {
//            UserRealm.curUser.
//        }
//        if weightField.text != nil{
//            U
//        }
//        if heightField.text != nil{
//            UserRealm.curUser
//        }
//        if ageField.text != nil{
//
//        }
    }
    @IBAction func goalChoiceAction(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0{
            caloryField.text = "300"
        }else if sender.selectedSegmentIndex == 1 {
            caloryField.text = "600"
        }else{
            caloryField.text = "900"
        }
    }
    func setUpButton(){
        submitButton.layer.borderColor = darkGreyColor.cgColor
        submitButton.layer.borderWidth = 1
        submitButton.layer.cornerRadius = 5
        submitButton.setTitleColor(overcastBlueColor, for: .highlighted)
    }
    func setUpText(){
        self.applySkyscannerThemeWithIcon(textField: heightField)
        self.applySkyscannerThemeWithIcon(textField: ageField)
        self.applySkyscannerThemeWithIcon(textField: caloryField)
        self.applySkyscannerThemeWithIcon(textField: weightField)
        heightField.title = "              Height"
        heightField.iconImage = UIImage(named: "height")
        ageField.title = "              Age"
        ageField.iconImage = UIImage(named: "age")
        caloryField.title = "              calories"
        caloryField.iconImage = UIImage(named: "gym")
        weightField.title = "              Weight lb"
        weightField.iconImage = UIImage(named: "weight")
        // plane icon as per https://fortawesome.github.io/Font-Awesome/cheatsheet/
        //heightField.iconText = "\u{f072}"
       
    }
    
        func applySkyscannerThemeWithIcon(textField: SkyFloatingLabelTextFieldWithIcon) {
            
            textField.iconColor = lightGreyColor
            textField.selectedIconColor = overcastBlueColor
            textField.iconType = .image
            
           
            textField.tintColor = overcastBlueColor
            textField.textColor = darkGreyColor
            textField.lineColor = lightGreyColor

            textField.selectedTitleColor = overcastBlueColor
            textField.selectedLineColor = overcastBlueColor
            
            textField.iconWidth = 65
            //textField.iconFont = UIFont(name: "FontAwesome", size: 35)
            textField.font = UIFont(name: "AppleSDGothicNeo-Regular", size: 18)

            textField.titleColor = overcastBlueColor
           // textField.minimumFontSize
        }

        
        
    
    
    func animateCircular(){
        circularView.startProgress(to: 100, duration: 6) {
            DispatchQueue.main.async {
                // We can animate the ring back to another value here, and it does so fluidly
                self.circularView.startProgress(to: 80, duration: 2)
                //self.circuler.showsValueKnob = true
                
            }
        }
    }

}
