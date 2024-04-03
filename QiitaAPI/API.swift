//
//  API.swift
//  QiitaAPI
//
//  Created by 井本智博 on 2024/04/03.
//

import Foundation

final class API {

    static let shared = API()
    private init() {}

    private let baseURL = "https://qiita.com/api/v2"

    private let clientID = "87951f55fd52f1720f6bb2f352ba19e4b7ba750d"
    //stateてリダイレクト後に返ってくる値じゃないの？
    let qiitaState = "bb17785d811bb1913ef54b0a7657de780defaa2d"



    enum  URLParameterName: String {
        case clientID = "client_id"
        case clientSecret = "client_secret"
        case scope = "scope"
        case state = "state"
        case code = "code"
    }

    var oAuthURL: URL {
        let endpoint = "/oauth/authorize"
        return URL(string: baseURL + endpoint + "?" +
                   "\(URLParameterName.clientID.rawValue)=\(clientID)" + "&" +
                   "\(URLParameterName.scope.rawValue)=read_qiita" + "&" +
                   "\(URLParameterName.state.rawValue)=\(qiitaState)")!
    }




}
