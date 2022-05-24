//
//  Model.swift
//  TestProjects
//
//  Created by Evgenii Kolgin on 24.05.2022.
//

import Foundation

// MARK: - CategoriesList
struct CategoriesList: Codable {
    let code: Int
    let list: [NewsCategory]
}

// MARK: - NewsCategory
struct NewsCategory: Codable, Hashable {
    let id: Int
    let name: String
}

// MARK: - NewsList
struct NewsList: Codable {
    let code: Int
    let list: [News]
}

// MARK: - News
struct News: Codable, Hashable {
    let id: Int
    let title, date, shortDescription: String
    let fullDescription: String?
}

// MARK: - NewsDetailsResponse
struct NewsDetails: Codable {
    let code: Int
    let news: News
}


