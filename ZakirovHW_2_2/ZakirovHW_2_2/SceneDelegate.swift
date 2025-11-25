//
//  SceneDelegate.swift
//  ZakirovHW_2_2
//
//  Created by Rus Zakirov on 24.11.2025.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene,
               willConnectTo session: UISceneSession,
               options connectionOptions: UIScene.ConnectionOptions) {

        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        // 1. Создаем окно, где будет жить все приложение
        let window = UIWindow(windowScene: windowScene)
        
        // 2. Создаем два корневых контроллера(лента и профиль)
        let feedVC = FeedViewController()
        feedVC.title = "Feed"
        
        let profileVC = ProfileViewController()
        profileVC.title = "Profile"
        
        // 3. Оборачиваем контроллеры в UINavigationController
        let feedNav = UINavigationController(rootViewController: feedVC)
        let profileNav = UINavigationController(rootViewController: profileVC)
        
        // 4. Создаем TabBar Controller
        let tabBarController = UITabBarController()
        tabBarController.viewControllers = [feedNav, profileNav]
        
        // 5. Добавляем подписи и иконки на табы
        feedNav.tabBarItem = UITabBarItem(
            title: "Feed",
            // Вид иконки по умолчанию
            image: UIImage(systemName: "house"),
            // Вид иконки при нажатии
            selectedImage: UIImage(systemName: "house.fill")
        )
        
        profileNav.tabBarItem = UITabBarItem(
            title: "Profile",
            image: UIImage(systemName: "person"),
            selectedImage: UIImage(systemName: "person.fill")
        )
        
        // 6. Назначаем rootViewController
        // Назначаем tabBarController как главный экран приложения
        window.rootViewController = tabBarController
        // Делаем это окно ключевым и видимым для пользователя
        window.makeKeyAndVisible()
        
        // Сохраняем окно в SceneDelegate
        self.window = window
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.

        // Save changes in the application's managed object context when the application transitions to the background.
        (UIApplication.shared.delegate as? AppDelegate)?.saveContext()
    }


}

