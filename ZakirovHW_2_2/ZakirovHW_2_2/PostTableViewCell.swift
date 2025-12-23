//
//  PostTableViewCell.swift
//  ZakirovHW_2_2
//
//  Created by Rus Zakirov on 09.12.2025.
//

import UIKit
import StorageService

final class PostTableViewCell: UITableViewCell {

// MARK: - Reuse ID
    static let reuseID = "PostTableViewCell"
    
// MARK: - UI элементы
    private let postImageView: UIImageView = {
            let imageView = UIImageView()
            imageView.translatesAutoresizingMaskIntoConstraints = false
            imageView.contentMode = .scaleAspectFill
            imageView.backgroundColor = .black
            imageView.clipsToBounds = true
            return imageView
        }()
    
    private let authorLabel: UILabel = {
            let label = UILabel()
            label.translatesAutoresizingMaskIntoConstraints = false
            label.font = .boldSystemFont(ofSize: 20)
            label.textColor = .black
            label.numberOfLines = 1
            return label
        }()

        private let descriptionLabel: UILabel = {
            let label = UILabel()
            label.translatesAutoresizingMaskIntoConstraints = false
            label.numberOfLines = 2
            label.font = .systemFont(ofSize: 20, weight: .bold)
            label.textColor = .black
            return label
        }()

        private let likesLabel: UILabel = {
            let label = UILabel()
            label.translatesAutoresizingMaskIntoConstraints = false
            label.font = .systemFont(ofSize: 16)
            label.textColor = .black
            return label
        }()

        private let viewsLabel: UILabel = {
            let label = UILabel()
            label.translatesAutoresizingMaskIntoConstraints = false
            label.font = .systemFont(ofSize: 16)
            label.textColor = .black
            label.textAlignment = .right
            return label
        }()

// MARK: - Инициализация
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier:  reuseIdentifier)
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

// MARK: - Настройка ячейки
    func configure(with post: Post) {
        postImageView.image = UIImage(named: post.image)
        authorLabel.text = post.author
        descriptionLabel.text = post.description
        likesLabel.text = "Likes: \(post.likes)"
        viewsLabel.text = "Views: \(post.views)"
    }

    
// MARK: - Добавляет UI элементы в иерархию
    private func setupViews() {
        contentView.addSubview(postImageView)
        contentView.addSubview(authorLabel)
        contentView.addSubview(descriptionLabel)
        contentView.addSubview(likesLabel)
        contentView.addSubview(viewsLabel)
    }

// MARK: - Констрейнты
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            postImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            postImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            postImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            postImageView.heightAnchor.constraint(equalToConstant: 200),

            authorLabel.topAnchor.constraint(equalTo: postImageView.bottomAnchor, constant: 16),
            authorLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            authorLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),

            descriptionLabel.topAnchor.constraint(equalTo: authorLabel.bottomAnchor, constant: 8),
            descriptionLabel.leadingAnchor.constraint(equalTo: authorLabel.leadingAnchor),
            descriptionLabel.trailingAnchor.constraint(equalTo: authorLabel.trailingAnchor),

            likesLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 12),
            likesLabel.leadingAnchor.constraint(equalTo: descriptionLabel.leadingAnchor),

            viewsLabel.centerYAnchor.constraint(equalTo: likesLabel.centerYAnchor),
            viewsLabel.trailingAnchor.constraint(equalTo: descriptionLabel.trailingAnchor),

            likesLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16)
        ])
    }

} // PostTableViewCell
