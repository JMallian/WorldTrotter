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
    //TODO: currently user cannot enter a negative number - possibly because this project was designed by people in California and not Minnesota :D 
}
