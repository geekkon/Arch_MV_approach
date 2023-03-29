//
//  ContentView.swift
//  Chuck_Norris_SUI_MV
//
//  Created by Dim on 12.03.2023.
//

import SwiftUI

struct ContentView: View {

    @EnvironmentObject private var contentModel: ContentModel

    var body: some View {
        TabView {
            NavigationView {
                CategoriesView()
                    .environmentObject(contentModel.categoriesModel)
            }
            .tabItem {
                Label("Categories", systemImage: "list.dash")
            }
            NavigationView {
                JokeView()
                    .environmentObject(contentModel.jokeModel)
            }
            .tabItem {
                Label("Random", systemImage: "star")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(
                ContentModel(
                    categoriesModel: .init(httpService: .init()),
                    jokeModel: .init(httpService: .init(), category: nil)
                )
            )
    }
}
