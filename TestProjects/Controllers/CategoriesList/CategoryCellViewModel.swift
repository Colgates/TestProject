//
//  CategoryCellViewModel.swift
//  TestProjects
//
//  Created by Evgenii Kolgin on 24.05.2022.
//

import Foundation

struct CategoryCellViewModel: Hashable {
    
    private let category: NewsCategory
    
    init(category: NewsCategory) {
        self.category = category
    }
    var id: Int {
        category.id
    }
    var name: String {
        category.name
    }
}

