//
//  JokeModelTests.swift
//  Chuck_Norris_SUI_MVTests
//
//  Created by Dim on 28.03.2023.
//

import XCTest
@testable import Chuck_Norris_SUI_MV

final class JokeModelTests: XCTestCase {

    private let httpService: MockHTTPService = .init(response: APIResponse.Joke.mock)

    @MainActor
    func test_model_initialState_isLoading() {
        let model = JokeModel(httpService: httpService, category: nil)
        XCTAssertEqual(model.state, .loading)
    }

    @MainActor
    func test_model_loadedState_whenFetchDone() async throws {
        let model = JokeModel(httpService: httpService, category: nil)
        try await model.fetch()
        XCTAssertEqual(model.state, .loaded(joke: .mock))
    }
}

private extension APIResponse.Joke {

    static var mock: Self {
        .init(
            icon_url: "",
            id: "",
            url: "",
            value: "Joke"
        )
    }
}
