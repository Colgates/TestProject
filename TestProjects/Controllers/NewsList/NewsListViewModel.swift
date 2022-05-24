//
//  NewsListViewModel.swift
//  TestProjects
//
//  Created by Evgenii Kolgin on 24.05.2022.
//

import Combine
import UIKit

class NewsListViewModel {
    
    private var category: CategoryCellViewModel
    
    private var models: [NewsCellViewModel] = []
    private var networkService: NetworkService
    
    var hasMoreNews = true
    var page: Int = 0
    
    init(with category: CategoryCellViewModel, networkService: NetworkService) {
        self.category = category
        self.networkService = networkService
    }

    var title: String {
        category.name
    }
    
    var id: Int {
        category.id
    }
    
    var dataSource: UITableViewDiffableDataSource<Int, NewsCellViewModel>?
    
    private var cancellables: Set<AnyCancellable> = []
    
    func fetchNews(isComplete: ((Bool)->Void)? = nil) {
        do {
            try networkService.fetchNewsList(with: id, page: page)
                .receive(on: RunLoop.main)
                .sink { completion in
                    isComplete?(true)
                } receiveValue: { [weak self] news in
                    if news.count < 10 {
                        self?.hasMoreNews = false
                    }
                    
                    let models = news.map { NewsCellViewModel(news: $0)}

                    self?.models.append(contentsOf: models)
                    self?.updateSnapshot()
                }
                .store(in: &cancellables)
        } catch {
            print(error)
        }
    }
    
    func createNewsListViewModelFor(_ indexPath: IndexPath) -> NewsDetailsViewModel? {
        guard let selectedItem = dataSource?.itemIdentifier(for: indexPath) else { return nil }
        return NewsDetailsViewModel(news: selectedItem, networkService: networkService)
    }
    
    private func updateSnapshot() {
        var snapshot = NSDiffableDataSourceSnapshot<Int, NewsCellViewModel>()
        snapshot.appendSections([0])
        snapshot.appendItems(models)
        self.dataSource?.apply(snapshot, animatingDifferences: true)
    }
}
