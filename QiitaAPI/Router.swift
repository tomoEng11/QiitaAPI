//
//  Router.swift
//  QiitaAPI
//
//  Created by 井本智博 on 2024/04/06.
//

import UIKit

final class Router {
    static let shared: Router = .init()
    private init() {}

    private var window: UIWindow?
    var vc: ViewController?

    func showRoot(window: UIWindow?) {
        let vc = ViewController()
        window?.rootViewController = vc
        window?.makeKeyAndVisible()
        self.window = window
    }

}
