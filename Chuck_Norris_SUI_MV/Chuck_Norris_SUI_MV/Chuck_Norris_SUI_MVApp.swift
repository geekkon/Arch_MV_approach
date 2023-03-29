//
//  Chuck_Norris_SUI_MVApp.swift
//  Chuck_Norris_SUI_MV
//
//  Created by Dim on 26.02.2023.
//

import SwiftUI

@main
struct Chuck_Norris_SUI_MVApp: App {

    private let httpService: HTTPService = .init()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(
                    ContentModel(
                        categoriesModel: .init(httpService: httpService),
                        jokeModel: .init(httpService: httpService, category: nil)
                    )
                )
        }
    }
}

// модель, которую слушает вью
// сервис, с которым взаимодействует модель
// собственно вью
// вью получает модель через @EnvironmentObject
