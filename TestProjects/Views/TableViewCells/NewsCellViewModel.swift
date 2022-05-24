//
//  NewsCellViewModel.swift
//  TestProjects
//
//  Created by Evgenii Kolgin on 24.05.2022.
//

import Foundation

struct NewsCellViewModel: Hashable {
    
    private let news: News
    
    init(news: News) {
        self.news = news
    }
    
    var id: Int {
        news.id
    }
    
    var title: String {
        news.title
    }
    var description: String {
        news.shortDescription
    }
    var date: String {
        news.date.isoDateConverter
    }
    
}

