//
//  API.swift
//  QiitaAPI
//
//  Created by 井本智博 on 2024/04/03.
//

import Foundation
import Alamofire

enum APIError: Error {
    case postAccessToken
    case getItems
}


final class API {

    static let shared = API()
    private init() {}

    private let baseURL = "https://qiita.com/api/v2"

    private let clientID = "87951f55fd52f1720f6bb2f352ba19e4b7ba750d"
    private let clientSecret = "938cc46b9db6946ff673dbffa782b40d18c02cfa"
    //stateてリダイレクト後に返ってくる値じゃないの？
    let qiitaState = "bb17785d811bb1913ef54b0a7657de780defaa2d"

    static let jsonDecoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        decoder.dateDecodingStrategy = .iso8601
        return decoder
    }()



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

    func postAccessToken(code: String, completion: ( (Result<QiitaAccessTokenModel, Error>) -> Void)? = nil) {
        let endpoint = "/access_tokens"
        guard let url = URL(string: baseURL + endpoint) else { return }
        let headers: HTTPHeaders = [
            "Contenttype": "application/json"
        ]
        let parameters: [String: Any] = [
            URLParameterName.clientID.rawValue: clientID,
            URLParameterName.clientSecret.rawValue: clientSecret,
            URLParameterName.code.rawValue: code
        ]
        AF.request(url, method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: headers).responseJSON { response in
            do {
                guard
                    let _data = response.data else {
                    completion?(.failure(APIError.postAccessToken))
                    return
                }
                let accessToken = try API.jsonDecoder.decode(QiitaAccessTokenModel.self, from: _data)
                completion?(.success(accessToken))
            } catch let error {
                completion?(.failure(error))
            }
        }


    }

    





}
