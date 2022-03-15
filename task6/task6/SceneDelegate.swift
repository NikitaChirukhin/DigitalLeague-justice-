//
//  SceneDelegate.swift
//  task6
//
//  Created by Никита Чирухин on 10.03.2022.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {

        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        window = UIWindow(windowScene: windowScene)
        window?.makeKeyAndVisible()
        let builder = ModuleBuilder()
        let tabBarModule = builder.createTabBarController()
        window?.rootViewController = tabBarModule
    }
}

