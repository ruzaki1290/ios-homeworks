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
    
    // Переопределяем поведение родительского метода жизненного цикла UIViewController viewDidLoad() при загрузке экрана
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .lightGray
        
        // Добавляем headerView внутрь корневого view
        view.addSubview(headerView)
        
        // Проверка загрузки View Controller
        // print("PROFILE VIEW DID LOAD! ✅")
    }
    
    // Переопределяем метод жиз. цикла UIViewController перед тем, как UIKit начнет расстановку всех subviews на экране
    override func viewWillLayoutSubviews() {
        
        super.viewWillLayoutSubviews()
        
        // Растягиваем headerView на весь экран
        headerView.frame = CGRect(
            x: 0,
            y: view.safeAreaInsets.top,
            width: view.bounds.width,
            height: view.bounds.height
        )
        
    }
    
}
