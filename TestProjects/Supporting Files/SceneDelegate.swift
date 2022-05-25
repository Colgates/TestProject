//
//  SceneDelegate.swift
//  TestProjects
//
//  Created by Evgenii Kolgin on 24.05.2022.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        let navVC = UINavigationController()
        navVC.navigationBar.tintColor = .label

        let networkService = NetworkManager()
        let coordinator = MainCoordinator(networkManager: networkService)
        coordinator.navigationController = navVC
        
        let window = UIWindow(windowScene: windowScene)
        window.rootViewController = navVC
        window.makeKeyAndVisible()
        self.window = window
        
        coordinator.start()
    }
}

