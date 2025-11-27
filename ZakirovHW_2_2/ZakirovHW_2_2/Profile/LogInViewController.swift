//
//  LogInViewController.swift
//  ZakirovHW_2_2
//
//  Created by Rus Zakirov on 27.11.2025.
//

import UIKit

class LogInViewController: UIViewController {
    
    // MARK: - UI Elements
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    private let contentView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    // Лого VK
    private let logoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "VKLogo")
        imageView.contentMode = .scaleAspectFit
        imageView.layer.cornerRadius = 10
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    // MARK: - Lifecycle Methods & Logic
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        
        // Добавляем scrollView на главный экран
        view.addSubview(scrollView)
        
        // Внутри scrollView добавляем contentView
        scrollView.addSubview(contentView)
        
        // Добовляем логотип в contentView
        contentView.addSubview(logoImageView)
        
        // Добавляем констрейнты
        setupConstraints()
    }
    
    // Методы показа/скрытия Nav Bar
    // Скрывает навбар когда заходишь на экран
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = true
    }
    
    // Навбар снова появляется когда уходишь
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.navigationBar.isHidden = false
    }
    
    // MARK: - setupConstraints
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            // ScrollView занимает весь экран
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            // contentView заполняет scrollView
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            
            // Ширина contentView равна ширине экрана
            contentView.widthAnchor.constraint(equalTo: view.widthAnchor),
            
            // Добавляем констрейнты логотипа
            logoImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 120),
            logoImageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            logoImageView.widthAnchor.constraint(equalToConstant: 100),
            logoImageView.heightAnchor.constraint(equalToConstant: 100),
        ])
    }

}
