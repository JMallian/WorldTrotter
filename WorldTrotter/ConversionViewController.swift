//
//  ConversionViewController.swift
//  WorldTrotter
//
//  Created by Jessica Mallian on 8/3/18.
//  Copyright © 2018 Jessica Mallian. All rights reserved.
//

import UIKit

class ConversionViewController: UIViewController {
    
    @IBOutlet var celsiusLabel: UILabel!
    
    @IBAction func fahrenheitFieldEditingChanged(_ textField: UITextField) {
        if let text = textField.text, !text.isEmpty {
            celsiusLabel.text = text
        }else{
            celsiusLabel.text = "???"
        }
    }
}
