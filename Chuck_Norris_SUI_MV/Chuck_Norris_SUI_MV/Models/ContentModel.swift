//
//  ContentModel.swift
//  Chuck_Norris_SUI_MV
//
//  Created by Dim on 16.03.2023.
//

import Foundation

// композициаонная модель
// модель под категории
// модель под шутку
// ! учесть что могут быть 2 модели под шутку. Одна при переходе с категории (в своем табе) и другая отдельная для второго таба с рандомной шуткой

@MainActor
class ContentModel: ObservableObject {

    var categoriesModel: CategoriesModel
    var jokeModel: JokeModel

    init(categoriesModel: CategoriesModel, jokeModel: JokeModel) {
        self.categoriesModel = categoriesModel
        self.jokeModel = jokeModel
    }
}
