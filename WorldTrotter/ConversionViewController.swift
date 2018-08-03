//
//  ConversionViewController.swift
//  WorldTrotter
//
//  Created by Jessica Mallian on 8/3/18.
//  Copyright © 2018 Jessica Mallian. All rights reserved.
//

import UIKit

class ConversionViewController: UIViewController {
    
    //MARK: properties
    @IBOutlet var celsiusLabel: UILabel!
    @IBOutlet var textField: UITextField!
    var fahrenheitValue: Measurement<UnitTemperature>? //optional because user may not have typed a number
    
    //MARK: computed property
    var celsiusValue: Measurement<UnitTemperature>? {
        if let fahrenheitValue = fahrenheitValue {
            return fahrenheitValue.converted(to: .celsius)
        }else{
            return nil
        }
    }
    
    
    //MARK: functions
    @IBAction func fahrenheitFieldEditingChanged(_ textField: UITextField) {
        if let text = textField.text, !text.isEmpty {
            celsiusLabel.text = text
        }else{
            celsiusLabel.text = "???"
        }
    }
    
    @IBAction func dismissKeyboard(_ sender: UITapGestureRecognizer) {
        textField.resignFirstResponder()
    }
}
