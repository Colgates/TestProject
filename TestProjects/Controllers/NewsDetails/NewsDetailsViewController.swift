//
//  NewsDetailsViewController.swift
//  TestProjects
//
//  Created by Evgenii Kolgin on 24.05.2022.
//

import Combine
import UIKit

class NewsDetailsViewController: UIViewController {
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let shortDescriptionLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let fullDescriptionLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var viewModel: NewsDetailsViewModel
    private var cancellables: Set<AnyCancellable> = []
    
    init(viewModel: NewsDetailsViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        setUpConstraints()
        setupBinders()
        fetchNews()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.prefersLargeTitles = false
    }
    
    private func setUpConstraints() {
        view.addSubviews(titleLabel, shortDescriptionLabel, fullDescriptionLabel)
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            titleLabel.heightAnchor.constraint(equalToConstant: 150),
            
            shortDescriptionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            shortDescriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
            shortDescriptionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            shortDescriptionLabel.heightAnchor.constraint(equalToConstant: 150),
            
            fullDescriptionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            fullDescriptionLabel.topAnchor.constraint(equalTo: shortDescriptionLabel.bottomAnchor, constant: 5),
            fullDescriptionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            fullDescriptionLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -10)
        ])
    }
    
    func setupBinders() {
        viewModel.$title
            .sink { self.titleLabel.text = $0 }
            .store(in: &cancellables)
        viewModel.$shortDescription
            .sink { self.shortDescriptionLabel.text = $0 }
            .store(in: &cancellables)
        viewModel.$fullDescription
            .sink { self.fullDescriptionLabel.attributedText = $0 }
            .store(in: &cancellables)
    }
    
    private func fetchNews() {
        viewModel.fetchNewsDetails()
    }
}

