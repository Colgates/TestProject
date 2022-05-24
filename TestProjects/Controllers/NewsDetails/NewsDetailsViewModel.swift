//
//  NewsDetailsViewModel.swift
//  TestProjects
//
//  Created by Evgenii Kolgin on 24.05.2022.
//

import Combine
import Foundation

class NewsDetailsViewModel {
    
    private var cancellables: Set<AnyCancellable> = []
    private var networkService: NetworkService
    
    private let id: Int
    
    @Published var title: String
    @Published var shortDescription: String
    
    @Published var fullDescription: NSAttributedString?
    
    init(news: NewsCellViewModel, networkService: NetworkService) {
        self.id = news.id
        self.title = news.title
        self.shortDescription = news.description
        self.networkService = networkService
    }
    
    func fetchNewsDetails() {
        do {
            try networkService.fetchDetailsForNews(with: id)
                .receive(on: RunLoop.main)
                .sink { completion in
                    print(completion)
                } receiveValue: { [weak self] news in
                    self?.fullDescription = news.fullDescription?.htmlAttributedString
                }
                .store(in: &self.cancellables)
        } catch {
            print(error)
        }
    }
}

