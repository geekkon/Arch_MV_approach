//
//  CategoriesModelTests.swift
//  Chuck_Norris_SUI_MVTests
//
//  Created by Dim on 28.03.2023.
//

import XCTest
@testable import Chuck_Norris_SUI_MV

final class CategoriesModelTests: XCTestCase {

    private let httpService: MockHTTPService = .init(response: [APIResponse.Category.mock])

    @MainActor
    func test_model_initialState_isLoading() {
        let model = CategoriesModel(httpService: httpService)
        XCTAssertEqual(model.state, .loading)
    }

    @MainActor
    func test_model_loadedState_whenFetchDone() async throws {
        let model = CategoriesModel(httpService: httpService)
        try await model.fetch()
        XCTAssertEqual(model.state, .loaded(categories: [.mock]))
    }
}

private extension APIResponse.Category {

    static var mock: Self {
        "Category"
    }
}
