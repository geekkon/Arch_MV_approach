//
//  MockHTTPService.swift
//  Chuck_Norris_SUI_MVTests
//
//  Created by Dim on 28.03.2023.
//

@testable import Chuck_Norris_SUI_MV

final class MockHTTPService<Response>: HTTPService {

    let response: Response

    init(response: Response) {
        self.response = response
    }

    override func perform<R>(_ httpRequest: R) async throws -> R.Response where R: HTTPRequest {
        response as! R.Response
    }
}
