//
//  CategoriesListViewController.swift
//  TestProjects
//
//  Created by Evgenii Kolgin on 24.05.2022.
//

import Combine
import UIKit

class CategoriesListViewController: UIViewController, Coordinating {
    
    var coordinator: Coordinator?
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return tableView
    }()
    
    private let viewModel: CategoriesListViewModel
    
    init(_ viewModel: CategoriesListViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "News"
        
        setUpTableView()
        configureDatasource()
        fetchCategoriesList()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        view.addSubview(tableView)
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
    
    private func setUpTableView() {
        tableView.delegate = self
    }
    
    private func configureDatasource() {
        viewModel.dataSource = UITableViewDiffableDataSource<Int, CategoryCellViewModel>(tableView: tableView, cellProvider: { tableView, indexPath, model in
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
            var configuration = cell.defaultContentConfiguration()
            configuration.text = model.name
            cell.contentConfiguration = configuration
            return cell
        })
    }
    
    private func fetchCategoriesList() {
        viewModel.fetchCategoriesList()
    }
}

// MARK: - UITableViewDelegate

extension CategoriesListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        if let model = viewModel.createNewsListViewModelFor(indexPath) {
            coordinator?.eventOccured(with: .toNewsList(model: model))
        }
    }
}





