//
//  QiitaAccessTokenModel.swift
//  QiitaAPI
//
//  Created by 井本智博 on 2024/04/04.
//

import Foundation

struct QiitaAccessTokenModel: Codable {
  let clientId: String
  let scopes: [String]
  let token: String
}
