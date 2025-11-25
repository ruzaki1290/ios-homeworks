//
//  PostViewController.swift
//  ZakirovIOS5_HW2_1(2)
//
//  Created by Rus Zakirov on 16.11.2025.
//

import UIKit

class PostViewController: UIViewController {

    var post: Post?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemOrange
        title = post?.title
        
        // Вызываем метод InfoButton
        infoButton()
    }
    
    // Кнопка показывает InfoViewController
    private func infoButton() {
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            title: "Info",
            style: .plain,
            target: self,
            action: #selector(showInfo)
        )
        
    }
    
    @objc private func showInfo() {
        let infoVC = InfoViewController()
        let navVC = UINavigationController(rootViewController: infoVC)
        navVC.modalPresentationStyle = .fullScreen
        present(navVC, animated: true)
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
