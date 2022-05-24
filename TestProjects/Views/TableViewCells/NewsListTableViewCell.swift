//
//  NewsListTableViewCell.swift
//  TestProjects
//
//  Created by Evgenii Kolgin on 24.05.2022.
//

import UIKit

class NewsListTableViewCell: UITableViewCell {
    
    static let identifier = "NewsListTableViewCell"
    
    private let newsTitle: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 18, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let shortDescription: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 16, weight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let newsDate: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 14, weight: .light)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUpConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUpConstraints() {
        contentView.addSubviews(newsTitle, shortDescription, newsDate)
        NSLayoutConstraint.activate([
            newsTitle.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            newsTitle.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            newsTitle.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            
            shortDescription.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            shortDescription.topAnchor.constraint(equalTo: newsTitle.bottomAnchor, constant: 10),
            shortDescription.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            
            newsDate.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            newsDate.topAnchor.constraint(equalTo: shortDescription.bottomAnchor, constant: 5),
            newsDate.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            newsDate.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10)
        ])
    }
    
    func configure(with viewModel: NewsCellViewModel) {
        newsTitle.text = viewModel.title
        shortDescription.text = viewModel.description
        newsDate.text = viewModel.date
    }
}

