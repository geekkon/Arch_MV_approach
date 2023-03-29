//
//  APIRequest.swift
//  Chuck_Norris_SUI_MV
//
//  Created by Dim on 16.03.2023.
//

extension HTTPRequest {

    var endpoint: String {
        "https://api.chucknorris.io/jokes"
    }

    var headers: [String: String] {
        ["Content-Type": "application/json"]
    }
}

enum APIRequest {

    struct Categories: HTTPRequest {

        typealias Response = [APIResponse.Category]

        let method: HTTPMethod = .GET
        let path: String = "/categories"
    }

    struct RandomJoke: HTTPRequest {

        typealias Response = APIResponse.Joke

        let method: HTTPMethod = .GET
        let path: String

        init(category: String?) {
            path = "/random\(category.map { "?category=\($0)" } ?? "")"
        }
    }
}
