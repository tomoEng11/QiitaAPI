//
//  UseDefaults+.swift
//  QiitaAPI
//
//  Created by 井本智博 on 2024/04/06.
//

import Foundation

extension UserDefaults {
    private var qiitaAccessTokenKey: String {
        "qiitaAccessTokenKey"
    }

    var qiitaAccessToken: String {
        get {
            self.string(forKey: qiitaAccessTokenKey) ?? ""
        }
        set {
            self.setValue(newValue, forKey: qiitaAccessTokenKey)
        }
    }
}
