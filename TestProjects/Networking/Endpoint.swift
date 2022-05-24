//
//  Endpoint.swift
//  TestProjects
//
//  Created by Evgenii Kolgin on 24.05.2022.
//

import Foundation

enum Endpoint {
    
    static let baseURL = "https://testtask.sebbia.com"
    
    case categoriesList
    case newsList(id: Int)
    case newsDetails
    
    var description: String {
        switch self {
        case .categoriesList:
            return "/v1/news/categories"
        case .newsList(let id):
            return "/v1/news/categories/\(id)/news"
        case .newsDetails:
            return "/v1/news/details"
        }
    }
}

