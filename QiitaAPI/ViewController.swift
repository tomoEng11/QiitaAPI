//
//  ViewController.swift
//  QiitaAPI
//
//  Created by 井本智博 on 2024/04/03.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    func openOAuthURL(url : URL) {
        UIApplication.shared.open(API.shared.oAuthURL)
    }
}

