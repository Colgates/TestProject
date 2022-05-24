//
//  CategoriesListViewModel.swift
//  TestProjects
//
//  Created by Evgenii Kolgin on 24.05.2022.
//

import Combine
import UIKit

class CategoriesListViewModel {
    
    var dataSource: UITableViewDiffableDataSource<Int, CategoryCellViewModel>?
    
    private var cancellables: Set<AnyCancellable> = []
    
    private let networkService: NetworkService
    
    init(networkService: NetworkService) {
        self.networkService = networkService
    }
    
    func fetchCategoriesList() {
        do {
            try networkService.fetchCategoriesList()
                .receive(on: RunLoop.main)
                .sink { completion in
                    print(completion)
                } receiveValue: { [weak self] categories in
                    let models = categories.map { CategoryCellViewModel(category: $0)}
                    
                    self?.updateSnapshot(with: models)
                }
                .store(in: &cancellables)
        } catch {
            print(error)
        }
    }
    
    func createNewsListViewModelFor(_ indexPath: IndexPath) -> NewsListViewModel? {
        guard let selectedItem = dataSource?.itemIdentifier(for: indexPath) else { return nil }
        return NewsListViewModel(with: selectedItem, networkService: networkService)
    }
    
    private func updateSnapshot(with items: [CategoryCellViewModel]) {
        var snapshot = NSDiffableDataSourceSnapshot<Int, CategoryCellViewModel>()
        snapshot.appendSections([0])
        snapshot.appendItems(items)
        self.dataSource?.apply(snapshot, animatingDifferences: true)
    }
}

