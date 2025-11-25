//
//  ProfileHeaderView.swift
//  ZakirovIOS5_HW2_1
//
//  Created by Rus Zakirov on 14.11.2025.
//

import UIKit

// Создаем кастомный UIView с двумя инициализаторами(стандартная структура)
class ProfileHeaderView: UIView {
    
    // MARK: - Subviews
    
    // 1-a. Создаем объект аватара класса UIImageView
    private let avatarImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "snowboarding")
        imageView.contentMode = .scaleAspectFill // За счет данного свойства, фото заполняет всю область imageView
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 50 // Задаем круглую форму аватарке
        imageView.layer.borderWidth = 3 // Задаем толщину рамки
        imageView.layer.borderColor = UIColor.white.cgColor // Задаем цвет рамки
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    
    
    // 1-b. Создаем объект имени класса Label
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Рустам Закиров"
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // 1-с. Создаем объект статуса класса Label
    private let statusLabel: UILabel = {
        let label = UILabel()
        label.text = "Best season of the year"
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.textColor = .darkGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // 1-d. Создаем объект TextField(поле ввода статуса)
    private let statusTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Введите новый статус"
        textField.backgroundColor = .white
        textField.layer.cornerRadius = 12
        textField.layer.borderWidth = 0.5
        textField.layer.borderColor = UIColor.lightGray.cgColor
        textField.font = UIFont.systemFont(ofSize: 14)
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    // 1-e. Добавляем action кнопку Show Status
    private let statusButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Обновить статус", for: .normal)
        button.backgroundColor = .systemBlue
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        button.layer.cornerRadius = 12
        
        // Добавляем тень кнопки
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOffset = CGSize(width: 4, height: 4)
        button.layer.shadowRadius = 4
        button.layer.shadowOpacity = 0.7
        
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    // MARK: - Init
    
    // Инициализатор при создании через код
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .lightGray
        setupSubviews() // Вызываем метод добавления subviews
        setupConstraints() // Вызываем метод расставления элементов по Auto Layout
        // Добавляем target кнопки statusButton
        statusButton.addTarget(self, action: #selector(showStatus), for: .touchUpInside)
    }
    
    // Инициализатор для Storyboard/XIB
    required init?(coder: NSCoder) {
        fatalError("init(coder:) Ошибка в использовании класса!")
    }
    
    // MARK: - Setup
    
    // 2. Добовляем объекты аватара, имени, статуса как subview и кнопки статуса
    private func setupSubviews() {
        addSubview(avatarImageView)
        addSubview(nameLabel)
        addSubview(statusLabel)
        addSubview(statusTextField)
        addSubview(statusButton)
    }
    
    // 3. Задаем положение и размер элементов по Auto Layout
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            
            // 3-a. Задаем фрейм аватарки
            avatarImageView.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            avatarImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            avatarImageView.widthAnchor.constraint(equalToConstant: 100),
            avatarImageView.heightAnchor.constraint(equalToConstant: 100),
            
            // 3-b. Задаем констрейнты расположения nameLabel
            nameLabel.topAnchor.constraint(equalTo: avatarImageView.topAnchor, constant: 8),
            nameLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 16),
            nameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            
            // 3-c. Задаем констрейнты расположения statusLabel
            statusLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 8),
            statusLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            statusLabel.trailingAnchor.constraint(equalTo: nameLabel.trailingAnchor),

            // 3-d. Задамем констрейнты расположения statusField
            statusTextField.topAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: 16),
            statusTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            statusTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            statusTextField.heightAnchor.constraint(equalToConstant: 40),
            
            // 3-e. Добавляем фрейм кнопки statusButton
            statusButton.topAnchor.constraint(equalTo: statusTextField.bottomAnchor, constant: 12),
            statusButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            statusButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            statusButton.heightAnchor.constraint(equalToConstant: 44)
            
        ])
    }
        
    // MARK: - Actions
    
    // 5-e. Добавляем действие к кнопке
    @objc private func showStatus() {
        if let text = statusTextField.text, !text.isEmpty {
            statusLabel.text = text
            statusTextField.text = ""
        } else {
            print("Введите статус!")
        }
    }

}
