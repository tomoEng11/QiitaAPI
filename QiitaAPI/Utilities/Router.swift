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
        let nav = UINavigationController(rootViewController: vc)
        window.rootViewController = nav
        window.makeKeyAndVisible()
        self.vc = vc
        self.window = window
    }

    func showSecond(from: UIViewController) {
        let nextVC = SecondViewController()
        show(from: from, next: nextVC, animated: true)
    }
}

private extension Router {
    func show(from: UIViewController, next: UIViewController, animated: Bool = true) {
        if let nav = from.navigationController {
            nav.pushViewController(next, animated: animated)
        } else {
            from.present(next, animated: animated, completion: nil)
        }
    }
}
