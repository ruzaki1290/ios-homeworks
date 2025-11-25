//
//  ProfileHeaderView.swift
//  ZakirovIOS5_HW2_1
//
//  Created by Rus Zakirov on 14.11.2025.
//

import UIKit

// Создаем кастомный UIView с двумя инициализаторами(стандартная структура)
class ProfileHeaderView: UIView {
    
    // 1-a. Создаем объект аватара класса UIImageView
    private let avatarImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "snowboarding")
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill // Если изображение портрет, либо ландшафт, то данный метод поможет ему заполнить весь квадрат, и скругление будет ровным по окружности
        return imageView
    }()
    
    
    
    // 1-b. Создаем объект имени класса Label
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Рустам Закиров"
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        label.textColor = .black
        return label
    }()
    
    // 1-с. Создаем объект статуса класса Label
    private let statusLabel: UILabel = {
        let label = UILabel()
        label.text = "Best season of the year"
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.textColor = .darkGray
        return label
    }()
    
    // 1-d. Добавляем action кнопку Show Status
    private let statusButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Показать статус", for: .normal)
        button.backgroundColor = .systemBlue
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        button.layer.cornerRadius = 10
        return button
    }()
    
    
    // Инициализатор при создании через код
    override init(frame: CGRect) {
        super.init(frame: frame)
        // 2. Добовляем объекты аватара, имени, статуса как subview и кнопки статуса
        addSubview(avatarImageView)
        addSubview(nameLabel)
        addSubview(statusLabel)
        addSubview(statusButton)
        
        // Добавляем target кнопки statusButton
        statusButton.addTarget(self, action: #selector(showStatus), for: .touchUpInside)
        
        // 4-d. Добавляем тень кнопки
        statusButton.layer.shadowColor = UIColor.black.cgColor
        statusButton.layer.shadowOffset = CGSize(width: 4, height: 4)
        statusButton.layer.shadowRadius = 4
        statusButton.layer.shadowOpacity = 0.7

    }
    
    // Инициализатор для Storyboard/XIB
    required init?(coder: NSCoder) {
        fatalError("init(coder:) Ошибка в использовании класса!")
    }
    
    // 3-a. Задаем фрейм аватарки
    override func layoutSubviews() {
        super.layoutSubviews()
        // Проверяем размер HeaderView(хедера)
        // print("LAYOUT:", bounds)
        
        let avatarSize: CGFloat = 100
        avatarImageView.frame = CGRect(
            x: 16,
            y: 16,
            width: avatarSize,
            height: avatarSize
        )
        
        avatarImageView.layer.cornerRadius = avatarSize / 2
        
        // 3-b. Задаем расположение nameLabel
        nameLabel.frame = CGRect(
            x: avatarImageView.frame.maxX + 27,
            y: avatarImageView.frame.minY + 16,
            width: bounds.width - avatarImageView.frame.maxX - 40,
            height: 22
        )
        
        // 3-c. Задаем расположение statusLabel
        statusLabel.frame = CGRect(
            x: nameLabel.frame.minX,
            y: nameLabel.frame.maxY + 4,
            width: nameLabel.frame.width,
            height: 18
        )
        
        // 3-d. Добавляем фрейм кнопки statusButton
        statusButton.frame = CGRect(
            x: 16,
            y: statusLabel.frame.maxY + 34,
            width: bounds.width - 32,
            height: 50
        )
    }
    
    // 5-d. Добавляем действие к кнопке
    @objc private func showStatus() {
        print("Статус: \(statusLabel.text ?? "")")
    }

}
