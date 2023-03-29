//
//  HTTPService.swift
//  Chuck_Norris_SUI_MV
//
//  Created by Dim on 16.03.2023.
//

import Foundation

class HTTPService {

    enum Error: Swift.Error {
        case badRequest
    }

    func perform<R: HTTPRequest>(_ httpRequest: R) async throws -> R.Response {

        guard let request = httpRequest.urlRequest else {
            throw Error.badRequest
        }

        let (data, _) = try await URLSession.shared.data(for: request)
        return try JSONDecoder().decode(R.Response.self, from: data)
    }
}
