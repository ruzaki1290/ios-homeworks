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
    
    // Поле логина
    private let loginField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Email or phone"
        textField.font = UIFont.systemFont(ofSize: 16)
        textField.textColor = .black
        textField.tintColor = .systemBlue
        textField.autocapitalizationType = .none
        
        textField.backgroundColor = .systemGray6
        textField.layer.borderColor = UIColor.lightGray.cgColor
        textField.layer.borderWidth = 0.5
        textField.layer.cornerRadius = 10
        
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 16, height: 0))
        textField.leftViewMode = .always
        
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        return textField
    }()
    
    // Поле пароля
    private let passwordField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Password"
        textField.font = UIFont.systemFont(ofSize: 16)
        textField.textColor = .black
        textField.tintColor = .systemBlue
        textField.autocapitalizationType = .none
        textField.isSecureTextEntry = true
        
        textField.backgroundColor = .systemGray6
        textField.layer.borderColor = UIColor.lightGray.cgColor
        textField.layer.borderWidth = 0.5
        textField.layer.cornerRadius = 10
        
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 16, height: 0))
        textField.leftViewMode = .always
        
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        return textField
    }()
    
    // Поле кнопки логина
    private let loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Log In", for: .normal)
        button.setTitleColor(.white, for: .normal)
        let pixelImage = UIImage(named: "blue_pixel")
        button.setBackgroundImage(pixelImage, for: .normal)
        button.setBackgroundImage(pixelImage, for: .highlighted)
        button.layer.cornerRadius = 10
        button.clipsToBounds = true
        
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()

    // MARK: - Lifecycle Methods & Logic
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        
        // Добавляем scrollView на главный экран
        view.addSubview(scrollView)
        
        // Внутри scrollView добавляем contentView
        scrollView.addSubview(contentView)
        
        // Добавляем логотип в contentView
        contentView.addSubview(logoImageView)
        
        // Добавляем поле логина в contentView
        contentView.addSubview(loginField)
        
        // Добавляем поле пароля в contentView
        contentView.addSubview(passwordField)
        
        // Добавляем кнопку логина в contentView
        contentView.addSubview(loginButton)
        
        // Добавляем действие кнопки "Log In", переход к ProfileViewController
        loginButton.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
        
        // Вызываем подписку на уведомления клавиатуры
        setupKeyboardNotifications()
        
        // Скрываем клавиатуру
        setupHideKeyboardGesture()
        
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
    
    // Подписка на уведомления клавиатуры
    private func setupKeyboardNotifications() {
        NotificationCenter.default.addObserver(
                self,
                selector: #selector(keyboardWillShow),
                name: UIResponder.keyboardWillShowNotification,
                object: nil
            )
        
        NotificationCenter.default.addObserver(
                self,
                selector: #selector(keyboardWillHide),
                name: UIResponder.keyboardWillHideNotification,
                object: nil
            )
    }
    
    // Метод скрывает клавиатуру
    private func setupHideKeyboardGesture() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        tap.cancelsTouchesInView = false   // Важный метод для того, чтобы кнопки продолжали работать
        view.addGestureRecognizer(tap)
    }

    @objc private func hideKeyboard() {
        view.endEditing(true)
    }

    
    @objc private func keyboardWillShow(_ notification: Notification) {
        guard let keyboardFrame = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect else { return }
        
        let keyboardHeight = keyboardFrame.height
        scrollView.contentInset.bottom = keyboardHeight + 20
        scrollView.verticalScrollIndicatorInsets.bottom = keyboardHeight
    }
    
    @objc private func keyboardWillHide(_ notification: Notification) {
        scrollView.contentInset.bottom = 0
        scrollView.verticalScrollIndicatorInsets.bottom = 0
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
            
            // Констрейнты логотипа
            logoImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 120),
            logoImageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            logoImageView.widthAnchor.constraint(equalToConstant: 100),
            logoImageView.heightAnchor.constraint(equalToConstant: 100),
            
            // Констрейнты поля логина
            loginField.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 120),
            loginField.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            loginField.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            loginField.heightAnchor.constraint(equalToConstant: 50),
            
            // Констрейнты поля пароля
            passwordField.topAnchor.constraint(equalTo: loginField.bottomAnchor),
            passwordField.leadingAnchor.constraint(equalTo: loginField.leadingAnchor),
            passwordField.trailingAnchor.constraint(equalTo: loginField.trailingAnchor),
            passwordField.heightAnchor.constraint(equalToConstant: 50),
            
            // Констрейнты кнопки логина
            loginButton.topAnchor.constraint(equalTo: passwordField.bottomAnchor, constant: 16),
            loginButton.leadingAnchor.constraint(equalTo: loginField.leadingAnchor),
            loginButton.trailingAnchor.constraint(equalTo: loginField.trailingAnchor),
            loginButton.heightAnchor.constraint(equalToConstant: 50),
            loginButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -40)
        ])
        
    }
    
    // MARK: - Actions
    @objc private func loginButtonTapped() {
        navigationController?.pushViewController(ProfileViewController(), animated: true)

    }

}
