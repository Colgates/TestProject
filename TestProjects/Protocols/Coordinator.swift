//
//  Coordinator.swift
//  TestProjects
//
//  Created by Evgenii Kolgin on 25.05.2022.
//

import UIKit

enum Event {
    case toNewsList(model: NewsListViewModel)
    case toNewsDetails(model: NewsDetailsViewModel)
}

protocol Coordinator {
    var navigationController: UINavigationController? { get set }
    
    func eventOccured(with type: Event)
    func start()
}

protocol Coordinating {
    var coordinator: Coordinator? { get set }
}
