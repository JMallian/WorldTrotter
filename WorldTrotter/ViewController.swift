//
//  ViewController.swift
//  WorldTrotter
//
//  Created by Jessica Mallian on 8/1/18.
//  Copyright © 2018 Jessica Mallian. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let firstFrame = CGRect(x: 160, y: 240, width: 100, height: 150)
        let firstView = UIView(frame: firstFrame)
        firstView.backgroundColor = .blue
        view.addSubview(firstView)
    }
}

