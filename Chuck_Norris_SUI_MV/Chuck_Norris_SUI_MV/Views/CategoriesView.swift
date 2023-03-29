//
//  CategoriesView.swift
//  Chuck_Norris_SUI_MV
//
//  Created by Dim on 12.03.2023.
//

import SwiftUI

struct CategoriesView: View {

    @EnvironmentObject private var model: CategoriesModel

    var body: some View {
        Group {
            switch model.state {
                case .loading:
                    ProgressView()
                case .loaded(let categories):
                    List(categories, id: \.self) { category in
                        NavigationLink(
                            category,
                            destination: JokeView()
                                .environmentObject(
                                    model.jokeModel(for: category)
                                )
                        )
                    }
            }
        }
        .navigationTitle("Categories")
        .task {
            do {
                try await model.fetch()
            } catch {
                debugPrint(error.localizedDescription)
            }
        }
    }
}

struct CategoriesView_Previews: PreviewProvider {
    static var previews: some View {
        CategoriesView()
            .environmentObject(
                CategoriesModel(
                    httpService: .init()
                )
            )
    }
}
