//
//  MapViewController.swift
//  WorldTrotter
//
//  Created by Jessica Mallian on 8/5/18.
//  Copyright © 2018 Jessica Mallian. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController {
    
    var mapView: MKMapView!
    
    override func loadView() {
        super.loadView()
        mapView = MKMapView()
        view = mapView 
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("MapViewController loaded it's view")
    }
}
