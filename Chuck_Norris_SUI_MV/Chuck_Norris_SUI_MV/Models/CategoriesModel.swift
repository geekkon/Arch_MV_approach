//
//  CategoriesModel.swift
//  Chuck_Norris_SUI_MV
//
//  Created by Dim on 16.03.2023.
//

import Foundation

@MainActor
class CategoriesModel: ObservableObject {

    enum State: Equatable {
        case loading
        case loaded(categories: [APIResponse.Category])
    }

    @Published var state: State = .loading

    private let httpService: HTTPService

    init(httpService: HTTPService) {
        self.httpService = httpService
    }

    func fetch() async throws {
        state = .loading
        let categories = try await httpService.perform(
            APIRequest.Categories()
        )
        state = .loaded(categories: categories)
    }

    func jokeModel(for category: APIResponse.Category) -> JokeModel {
        JokeModel(httpService: httpService, category: category)
    }
}
