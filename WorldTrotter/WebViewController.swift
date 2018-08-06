//
//  WebViewController.swift
//  WorldTrotter
//
//  Created by Jessica Mallian on 8/6/18.
//  Copyright © 2018 Jessica Mallian. All rights reserved.
//

import UIKit
import WebKit

class WebViewController: UIViewController {
    
    var webView: WKWebView!
    
    override func loadView() {
        super.loadView()
        webView = WKWebView()
        let url = URL(string: "https://www.bignerdranch.com")!
        webView.load(URLRequest(url: url))
        webView.allowsBackForwardNavigationGestures = true
        view = webView 
    }
}
