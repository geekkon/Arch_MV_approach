//
//  APIResponse.swift
//  Chuck_Norris_SUI_MV
//
//  Created by Dim on 16.03.2023.
//

enum APIResponse {

    typealias Category = String

    struct Joke: Equatable, Decodable {
        let icon_url: String
        let id: String
        let url: String
        let value: String
    }
}
