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

    private var window: UIWindow!
    private(set) weak var vc: ViewController!

    func showRoot(window: UIWindow) {
        let vc = ViewController()
        window.rootViewController = vc
        window.makeKeyAndVisible()
        self.vc = vc
        self.window = window
    }

    func showSecond() {
        let vc = SecondViewController()
        let nav = UINavigationController()
        nav.pushViewController(vc, animated: true)
    }
}
