//
//  ProfileViewController.swift
//  ZakirovIOS5_HW2_1
//
//  Created by Rus Zakirov on 14.11.2025.
//

import UIKit

// Создаем класс-контроллер целого экрана и наследуем класс жизненного цикла UIViewController
class ProfileViewController: UIViewController {
    
    // Создаем экземпляр шапки профиля
    private let headerView = ProfileHeaderView()
    
    // Добовляем объект нижней кнопки
    private let bottomButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Удалить аккаунт", for: .normal)
        button.backgroundColor = .systemRed
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        button.layer.cornerRadius = 12
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    // Переопределяем поведение родительского метода жизненного цикла UIViewController viewDidLoad() при загрузке экрана
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .lightGray
        
        // Добавляем метод headerView внутрь корневого view
        setupHeaderView()
        
        // Добавляем метод bottomButton внутрь корневого view
        setupBottomButton()
        
        // Проверка загрузки View Controller
        // print("PROFILE VIEW DID LOAD! ✅")
        
        // Добавляем метод нажатия нижней кнопки
        bottomButton.addTarget(self, action: #selector(bottomButtonTapped), for: .touchUpInside)
    }
    
    // Переопределяем метод жиз. цикла UIViewController перед тем, как UIKit начнет расстановку всех subviews на экране
    private func setupHeaderView() {
           view.addSubview(headerView)
           headerView.translatesAutoresizingMaskIntoConstraints = false
           
           NSLayoutConstraint.activate([
               // Сверху к safe area
               headerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
               
               // Слева и справа без отступов
               headerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
               headerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
               
               // Фиксированная высота
               headerView.heightAnchor.constraint(equalToConstant: 220)
           ])
       }
    
    // Создаем объект setupBottomButton
    private func setupBottomButton() {
        view.addSubview(bottomButton)

        NSLayoutConstraint.activate([
            bottomButton.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            bottomButton.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            bottomButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            bottomButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    // Добовляем action к bottomButton
    @objc private func bottomButtonTapped() {
        print("Нажата нижняя кнопка!")
    }


}
