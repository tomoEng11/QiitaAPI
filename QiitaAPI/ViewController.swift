//
//  ViewController.swift
//  QiitaAPI
//
//  Created by 井本智博 on 2024/04/03.
//

import UIKit

class ViewController: UIViewController {


    private let button: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .systemTeal
        button.addTarget(self, action: #selector(openOAuthURL), for: .touchUpInside)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(button)
        view.backgroundColor = .white

        NSLayoutConstraint.activate([
            button.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            button.heightAnchor.constraint(equalToConstant: 50),
            button.widthAnchor.constraint(equalToConstant: 180),
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
//なんでVCで受け取るのか？なぜURL型で返ってくるとわかるのか？
    func openURL(url : URL) {

        DLog()

        guard let queryItem = URLComponents(string: url.absoluteString)?.queryItems,
              let code = queryItem.first(where: { $0.name == "code" })?.value,
              let getState = queryItem.first(where: { $0.name == "state"})?.value,
              getState == API.shared.qiitaState
        else {
            DLog()
            return
        }

        DLog()
        //アクセストークンを取得
        API.shared.postAccessToken(code: code) { result in
            switch result {
            case .success(let accessToken):
                DLog(accessToken)
                UserDefaults.standard.qiitaAccessToken = accessToken.token
                Router.shared.showSecond()

            case .failure(let error):
                DLog(error)
            }
        }
    }
}

private extension UIViewController {

    @objc func openOAuthURL() {
        UIApplication.shared.open(API.shared.oAuthURL)
    }
}

