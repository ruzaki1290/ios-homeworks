//
//  PostViewController.swift
//  ZakirovIOS5_HW2_1(2)
//
//  Created by Rus Zakirov on 16.11.2025.
//

import UIKit
import StorageService

class PostViewController: UIViewController {

    var post: Post?

// MARK: - UI Labels
    private let postImageView: UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = false
        return iv
    }()
    
    private let titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.font = .boldSystemFont(ofSize: 24)
        titleLabel.textAlignment = .center
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        return titleLabel
    }()
    
    private let descriptionLabel: UILabel = {
        let descriptionLabel = UILabel()
        descriptionLabel.font = .systemFont(ofSize: 16)
        descriptionLabel.textColor = .lightGray
        descriptionLabel.textAlignment = .center
        descriptionLabel.numberOfLines = 0
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        return descriptionLabel
    }()
    
    private let likesLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let viewsLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
// MARK: - Lifecycle Methods & Logic
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        
        view.addSubview(postImageView)
        view.addSubview(titleLabel)
        view.addSubview(descriptionLabel)
        view.addSubview(likesLabel)
        view.addSubview(viewsLabel)
        
        setupUI()
        setupData()
        infoButton()
        
    }
 
// MARK: - Constraints
    private func setupUI() {
        
        NSLayoutConstraint.activate([
            postImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            postImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            postImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            postImageView.heightAnchor.constraint(equalToConstant: 250),
            
            titleLabel.topAnchor.constraint(equalTo: postImageView.bottomAnchor, constant: 16),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8),
            descriptionLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            descriptionLabel.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
            
            likesLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 16),
            likesLabel.leadingAnchor.constraint(equalTo: descriptionLabel.leadingAnchor),

            viewsLabel.centerYAnchor.constraint(equalTo: likesLabel.centerYAnchor),
            viewsLabel.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor)
            
        ])
        
        guard let post = post else {
            titleLabel.text = "Post не передан! ❌"
            return
        }
        
        titleLabel.text = post.author
        descriptionLabel.text = post.description
        
    }
 
// MARK: - Info Button
    // Кнопка показывает InfoViewController
    private func infoButton() {
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            title: "Info",
            style: .plain,
            target: self,
            action: #selector(showInfo)
        )
        
    }

// MARK: - setupData()
    private func setupData() {
        guard let post = post else { return }

        postImageView.image = UIImage(named: post.image)
        descriptionLabel.text = post.description
        likesLabel.text = "Likes: \(post.likes)"
        viewsLabel.text = "Views: \(post.views)"
    }

// MARK: - Actions
    @objc private func showInfo() {
        let infoVC = InfoViewController()
        let navVC = UINavigationController(rootViewController: infoVC)
        navVC.modalPresentationStyle = .fullScreen
        present(navVC, animated: true)
    }

}
