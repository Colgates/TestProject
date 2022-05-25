//
//  MainCoordinator.swift
//  TestProjects
//
//  Created by Evgenii Kolgin on 25.05.2022.
//

import Foundation
import UIKit


class MainCoordinator: Coordinator {
    var navigationController: UINavigationController?
    
    var networkManager: NetworkService
    
    init(networkManager: NetworkService) {
        self.networkManager = networkManager
    }
    
    func eventOccured(with type: Event) {
        switch type {
        case .toNewsList(let model):
            var vc: UIViewController & Coordinating = NewsListViewController(model)
            vc.coordinator = self
            navigationController?.pushViewController(vc, animated: true)
        case .toNewsDetails(let model):
            var vc: UIViewController & Coordinating = NewsDetailsViewController(viewModel: model)
            vc.coordinator = self
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    func start() {
        let viewModel = CategoriesListViewModel(networkService: networkManager)
        var vc: UIViewController & Coordinating = CategoriesListViewController(viewModel)
        vc.coordinator = self
        navigationController?.setViewControllers([vc], animated: true)
    }
}
