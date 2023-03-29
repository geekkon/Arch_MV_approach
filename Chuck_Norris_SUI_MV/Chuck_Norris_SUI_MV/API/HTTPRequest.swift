//
//  HTTPRequest.swift
//  Chuck_Norris_SUI_MV
//
//  Created by Dim on 16.03.2023.
//

import Foundation

enum HTTPMethod: String {
    case GET
    case POST
    case PATCH
    case DELETE
}

protocol HTTPRequest {

    associatedtype Response: Decodable

    var endpoint: String { get }
    var path: String { get }
    var method: HTTPMethod { get }
    var headers: [String: String] { get }
    var parameters: [String: Any]? { get }
}

extension HTTPRequest {

    var parameters: [String: Any]? {
        nil
    }
}

extension HTTPRequest {

    var urlRequest: URLRequest? {

        guard let url = URL(string: endpoint + path) else {
            return nil
        }

        var request = URLRequest(url: url)

        request.allHTTPHeaderFields = headers
        request.httpMethod = method.rawValue
        request.httpBody = parameters.flatMap {
            try? JSONSerialization.data(
                withJSONObject: $0,
                options: []
            )
        }

        return request
    }
}
