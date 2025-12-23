//
//  FeedViewController.swift
//  ZakirovIOS5_HW2_1(2)
//
//  Created by Rus Zakirov on 16.11.2025.
//

import UIKit

class FeedViewController: UIViewController {

    let post = Post(
        author: "Rus",
        description: "Test description",
        image: "post1",
        likes: 0,
        views: 0
    )

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Вызываем метод настройки страницы
        setUpView()
        // Вызываем метод кнопки
        setupButton()
    }
    
    // Задаем фоновый цвет и загаловок страницы
    private func setUpView() {
        view.backgroundColor = .white
        title = "Feed"
    }
    
    
    // Создаем кнопнку которая открывает страницу постов
    private func setupButton() {
        let button = UIButton(type: .system)
        button.setTitle("Open Post", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 18, weight: .medium)
        button.addTarget(self, action: #selector(openPost), for: .touchUpInside)
        
        view.addSubview(button)
        
        // Отключаем автоматическое создание ограничений(constraints) и сами задаем Auto Layout
        button.translatesAutoresizingMaskIntoConstraints = false
        
        // Задаем свои ограничения/стили
        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
    @objc private func openPost() {
        let postVC = PostViewController()
        // Передаем данные Post.swift
        postVC.post = post
        navigationController?.pushViewController(postVC, animated: true)
    }
}
