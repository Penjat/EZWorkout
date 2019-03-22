//
//  SetUpVC.swift
//  EZWorkout
//
//  Created by Yilei Huang on 2019-03-20.
//  Copyright © 2019 Spencer Symington. All rights reserved.
//

import UIKit
import SkyFloatingLabelTextField
class SetUpVC: UIViewController,UITextFieldDelegate {

    @IBOutlet weak var maleBtn: UIButton!
    
    @IBOutlet weak var femaleBtn: UIButton!
    @IBOutlet weak var heightTxt: SkyFloatingLabelTextFieldWithIcon!
    @IBOutlet weak var weightTxt: SkyFloatingLabelTextFieldWithIcon!
    
    @IBOutlet weak var nextBtn: UIButton!
    
    
    let lightGreyColor: UIColor = UIColor(red: 197 / 255, green: 205 / 255, blue: 205 / 255, alpha: 1.0)
    let darkGreyColor: UIColor = UIColor(red: 52 / 255, green: 42 / 255, blue: 61 / 255, alpha: 1.0)
    let overcastBlueColor: UIColor = UIColor(red: 0, green: 187 / 255, blue: 204 / 255, alpha: 1.0)
    var textFields = [SkyFloatingLabelTextFieldWithIcon]()

    override func viewDidLoad() {
        super.viewDidLoad()
        let idleColor1 = #colorLiteral(red: 0.8964110017, green: 0.6467557549, blue: 0.6463074088, alpha: 1)
        let idleColor2 = #colorLiteral(red: 0.1764705926, green: 0.01176470611, blue: 0.5607843399, alpha: 1)
        //TODO put in animation extention
        let gradient = CAGradientLayer()
        //startGradient()

        gradient.colors = [idleColor1.cgColor, idleColor2.cgColor]
        gradient.locations = [0.0 , 1.0]
        gradient.startPoint = CGPoint(x: 0.0, y: 1.0)
        gradient.endPoint = CGPoint(x: 1.0, y: 0.0)

        gradient.frame = CGRect(x: 0.0, y: 0.0, width: self.view.frame.size.width, height: self.view.frame.size.height)
        self.view.layer.insertSublayer(gradient, at: 0)
        nextBtn.layer.cornerRadius = 10
        setUpField()
        textFields = [heightTxt,weightTxt]
        for text in textFields{
            text.delegate = self
        }
        
        // Do any additional setup after loading the view.
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    func setUpField(){
        heightTxt.title = "                 Height"
        heightTxt.iconImage = UIImage(named: "height")
        weightTxt.title = "                 Weight"
        weightTxt.iconImage = UIImage(named: "weight")
        self.applySkyscannerThemeWithIcon(textField: heightTxt)
        self.applySkyscannerThemeWithIcon(textField: weightTxt)
        
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

    @IBAction func nextAction(_ sender: Any) {
    }
    
}
