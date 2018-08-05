//
//  ConversionViewController.swift
//  WorldTrotter
//
//  Created by Jessica Mallian on 8/3/18.
//  Copyright © 2018 Jessica Mallian. All rights reserved.
//

import UIKit

class ConversionViewController: UIViewController, UITextFieldDelegate {
    
    //MARK: properties
    @IBOutlet var celsiusLabel: UILabel!
    @IBOutlet var textField: UITextField!
    
    //MARK: computed property
    var celsiusValue: Measurement<UnitTemperature>? {
        if let fahrenheitValue = fahrenheitValue {
            return fahrenheitValue.converted(to: .celsius)
        }else{
            return nil
        }
    }
    
    //MARK: property observer
    var fahrenheitValue: Measurement<UnitTemperature>? {
        didSet {
            updateCelsiusLabel()
        }
    }
    
    //MARK: number formatter
    let numberFormatter: NumberFormatter = {
        let nf = NumberFormatter()
        nf.numberStyle = .decimal
        nf.minimumFractionDigits = 0
        nf.maximumFractionDigits = 1
        return nf
    }()
    
    
    //MARK: functions
    override func viewDidLoad() {
        super.viewDidLoad()
        print("ConversionViewController loaded it's view.")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateBackgroundColor()
    }
    
    @IBAction func fahrenheitFieldEditingChanged(_ textField: UITextField) {
        if let text = textField.text, let value = Double(text) {
            fahrenheitValue = Measurement(value: value, unit: .fahrenheit)
        }else{
            fahrenheitValue = nil
        }
    }
    
    @IBAction func dismissKeyboard(_ sender: UITapGestureRecognizer) {
        textField.resignFirstResponder()
    }
    
    func updateCelsiusLabel() {
        if let celsiusValue = celsiusValue {
            celsiusLabel.text = numberFormatter.string(from: NSNumber(value: celsiusValue.value))
        }else{
            celsiusLabel.text = "???"
        }
    }
    
    //MARK: delegate method
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        //don't want to allow more than 1 decimal
        let existingTextHasDecimalSeparator = textField.text?.range(of: ".")
        let replacementTextHasDecimalSeparator = string.range(of: ".")
        
        //don't want to allow letters either
        let letters = NSCharacterSet.letters
        
        if (existingTextHasDecimalSeparator != nil && replacementTextHasDecimalSeparator != nil) || (string.rangeOfCharacter(from: letters) != nil) {
            return false
        }else{
            return true
        }
    }
    
    //MARK: Silver Challenge: Dark Mode - update background color of ConverstionViewController based on the time of day, override viewWillAppear to accomplish this
    func updateBackgroundColor() {
        let calendar = Calendar.current
        let date = Date()
        let hour = calendar.component(.hour, from: date)
        if hour < 7 || hour > 18 {
            view.backgroundColor = .gray
        }else{
            view.backgroundColor = UIColor(red: 136/255, green: 192/255, blue: 183/255, alpha: 1.0)
        }
    }
    //TODO: currently user cannot enter a negative number - possibly because this project was designed by people in California and not Minnesota :D 
}
