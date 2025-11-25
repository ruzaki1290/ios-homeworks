//
//  InfoViewController.swift
//  ZakirovIOS5_HW2_1(2)
//
//  Created by Rus Zakirov on 16.11.2025.
//

import UIKit

class InfoViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground
        title = "Info"
        
        setUpButton()
        setupCloseButton()
    }
    
    // Кнопка UIAlertController
    private func setUpButton() {
        let button = UIButton(type: .system)
        button.setTitle("Show Alert", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 18, weight: .medium)
        button.addTarget(self, action: #selector(showAlert), for: .touchUpInside)
        
        view.addSubview(button)
        
        button.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
    // Кнопка что бы закрыть страницу Info
    private func setupCloseButton() {
        navigationItem.leftBarButtonItem = UIBarButtonItem(
            title: "Закрыть",
            style: .plain,
            target: self,
            action: #selector(closeInfo)
        )
    }
    
    // Показываем Alert
    @objc private func showAlert() {
        let alert = UIAlertController(
            title: " Важная информация",
            message: "Вы хотите продолжить?",
            preferredStyle: .alert
        )
        
        // Первая кнопка
        alert.addAction(UIAlertAction(title: "Хорошо", style: .default, handler: { _ in
            print("Пользователь нажал Хорошо 👍")
        }))
        
        // Вторая кнопка
        alert.addAction(UIAlertAction(title: "Отмена", style: .default, handler: { _ in
            print("Пользователь нажал Отмена 👎")
        }))
        
        present(alert, animated: true)
    }
    
    @objc private func closeInfo() {
        dismiss(animated: true)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
