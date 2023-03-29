//
//  JokeView.swift
//  Chuck_Norris_SUI_MV
//
//  Created by Dim on 13.03.2023.
//

import SwiftUI

struct JokeView: View {

    @EnvironmentObject private var model: JokeModel

    var body: some View {
        Group {
            switch model.state {
                case .loading:
                    ProgressView()
                case .loaded(let joke):
                    ScrollView {
                        VStack(spacing: 40) {
                            Image("chucknorris")
                                .resizable()
                                .scaledToFit()
                                .padding(.top, 40)
                            Text(joke.value)
                                .font(.title)
                            Spacer()
                        }
                        .padding(.horizontal, 20)
                    }
            }
        }
        .navigationTitle(model.category?.capitalized ?? "Random")
        .navigationBarItems(
            trailing: Button(
                action: {
                    Task {
                        do {
                            try await model.fetch()
                        } catch {
                            debugPrint(error.localizedDescription)
                        }
                    }
                }
            ) {
                Image(systemName: "arrow.2.circlepath")
            }
        )
        .task {
            do {
                try await model.fetch()
            } catch {
                debugPrint(error.localizedDescription)
            }
        }
    }
}

struct JokeView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            JokeView()
                .environmentObject(
                    JokeModel(
                        httpService: .init(),
                        category: nil
                    )
                )
        }
    }
}
