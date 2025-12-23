//
//  ProfileViewController.swift
//  ZakirovIOS5_HW2_1
//
//  Created by Rus Zakirov on 14.11.2025.
//

import UIKit
import StorageService

// Создаем класс-контроллер целого экрана и наследуем класс жизненного цикла UIViewController
class ProfileViewController: UIViewController {
    
    
    
    // MARK: - Свойства
    private let tableView: UITableView = {
        
        let tableView = UITableView()
        // tableView.backgroundColor = .white
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        return tableView
        
    }()
    
// MARK: - Header таблицы
    private let profileHeaderView = ProfileHeaderView()
    
// MARK: - Posts
    private let posts: [Post] = [
        Post(
            author: "Rus",
            description: "Best season of the year",
            image: "post1",
            likes: 240,
            views: 312
        ),
        Post(
            author: "Igor",
            description: "What a great trip",
            image: "post2",
            likes: 766,
            views: 893
        ),
        Post(
            author: "Dima",
            description: "The best oysters in town!",
            image: "post3",
            likes: 1024,
            views: 2048
        ),
        Post(
            author: "Alice",
            description: "What were they building there?",
            image: "post4",
            likes: 768,
            views: 1234
        ),
        Post(
            author: "Nika",
            description: "What a delecious snack!",
            image: "post5",
            likes: 834,
            views: 1558
        ),
        Post(
            author: "Mike",
            description: "Memories of summer",
            image: "post6",
            likes: 644,
            views: 1234
        )
    ]
    
// MARK: - viewDidLoad()
    // Переопределяем поведение родительского метода жизненного цикла UIViewController viewDidLoad() при загрузке экрана
    override func viewDidLoad() {
        super.viewDidLoad()
        
        #if DEBUG
        view.backgroundColor = .systemYellow
        #else
        view.backgroundColor = .systemIndigo
        #endif
        
        // view.backgroundColor = .white
        title = "Profile"
        
        view.addSubview(tableView)
        setupTableViewConstraints()
        
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.register(
            PostTableViewCell.self,
            forCellReuseIdentifier: PostTableViewCell.reuseID
        )
        
        tableView.rowHeight = UITableView.automaticDimension
        tableView.rowHeight = 400
        
        profileHeaderView.frame = CGRect(
            x: 0,
            y: 0,
            width: view.frame.width,
            height: 300
        )
        
        tableView.tableHeaderView = profileHeaderView
        
    }
    
// MARK: - Constraints
    private func setupTableViewConstraints() {
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
    }
    
} // ProfileViewController

// MARK: - UITableViewDataSource
    extension ProfileViewController: UITableViewDataSource {
        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return posts.count
        }
        
        func tableView(_ tableView: UITableView,
                       cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            
            let cell = tableView.dequeueReusableCell(
                withIdentifier: PostTableViewCell.reuseID,
                for: indexPath
            ) as! PostTableViewCell
            
            // Берем модель
            let post = posts[indexPath.row]
            // Передаем в ячейку
            cell.configure(with: post)

            return cell
        }
        
    }

// MARK: - UITableViewDelegate
    extension ProfileViewController: UITableViewDelegate {
        
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            tableView.deselectRow(at: indexPath, animated: true)
            
            let selectedPost = posts[indexPath.row]
            
            let postVC = PostViewController()
            postVC.post = selectedPost
            
            navigationController?.pushViewController(postVC, animated: true)
            
        }
        
    }

