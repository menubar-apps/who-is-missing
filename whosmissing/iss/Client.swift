//
//  Client.swift
//  whosmissing
//
//  Created by Pavel Makhov on 2024-04-29.
//

import Foundation
import Alamofire

public class IssApiClient {
    
    func getExpedition(completion: @escaping (Result<Expedition, ClientError>) -> Void) {
        let apiUrl = "https://corquaid.github.io/international-space-station-APIs/JSON/people-in-space.json"
        AF.request(apiUrl, method: .get, encoding: JSONEncoding.default)
            .validate(statusCode: 200..<300)
            .responseDecodable(of: Expedition.self) { response in
                switch response.result {
                case .success(let expedition):
                    completion(.success(expedition))
                case .failure(let error):
                    print(error)
                    completion(.failure(.unexpected(message: error.localizedDescription)))
                }
            }
    }
    
}

enum ClientError: Error {
    case unexpected(message: String?)
    case tokenNotSet
}
