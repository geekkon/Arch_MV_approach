//
//  JokeModel.swift
//  Chuck_Norris_SUI_MV
//
//  Created by Dim on 16.03.2023.
//

import Foundation

@MainActor
class JokeModel: ObservableObject {

    enum State: Equatable {
        case loading
        case loaded(joke: APIResponse.Joke)
    }

    @Published var state: State = .loading

    private let httpService: HTTPService

    let category: APIResponse.Category?

    init(httpService: HTTPService, category: APIResponse.Category?) {
        self.httpService = httpService
        self.category = category
    }

    func fetch() async throws {
        state = .loading
        let joke = try await httpService.perform(
            APIRequest.RandomJoke(category: category)
        )
        state = .loaded(joke: joke)
    }
}
