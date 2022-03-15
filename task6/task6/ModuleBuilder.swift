//
//  ModuleBuilder.swift
//  task6
//
//  Created by Никита Чирухин on 10.03.2022.
//

import UIKit

protocol ModuleBuilderProtocol {
    func createTabBarController() -> UITabBarController
}

final class ModuleBuilder {
    
    private func createNavigationViewController(controller: UIViewController, title: String, image: UIImage?) -> UINavigationController {
        let navigationController = UINavigationController(rootViewController: controller)
        controller.title = title
        controller.modalPresentationStyle = .fullScreen
        navigationController.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.systemYellow]
        navigationController.navigationBar.isTranslucent = true
        navigationController.navigationBar.prefersLargeTitles = true
        navigationController.navigationBar.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        navigationController.tabBarItem = UITabBarItem(title: title, image: image, selectedImage: nil)
        return navigationController
    }
    
    private func createXIBViewController() -> UIViewController {
        let viewController = XIBViewController()
        let navigationViewController = createNavigationViewController(controller: viewController, title: "XIB", image: nil)
        return navigationViewController
    }
    
    private func createAutoLayoutViewController() -> UIViewController {
        let viewController = AutoLayoutViewController()
        let navigationViewController = createNavigationViewController(controller: viewController, title: "AutoLayout", image: nil)
        return navigationViewController
    }
    
    private func createManualViewController() -> UIViewController {
        let viewController = ManualViewController()
        let navigationViewController = createNavigationViewController(controller: viewController, title: "Manual", image: nil)
        return navigationViewController
    }
    
    private func createViewControllerWithNavigation() -> UIViewController {
        let viewController = NavigationViewController()
        let navigationViewController = createNavigationViewController(controller: viewController, title: "Navigation", image: nil)
        return navigationViewController
    }
    
    private func createViewControllerWithLargeNavigation() -> UIViewController {
        let viewController = LargeNavigationViewController()
        let navigationViewController = createNavigationViewController(controller: viewController, title: "LargeNav", image: nil)
        return navigationViewController
    }
    
}

extension ModuleBuilder: ModuleBuilderProtocol {
    func createTabBarController() -> UITabBarController {
        
        let tabBarController = UITabBarController()
        
        
        tabBarController.viewControllers = [createXIBViewController(),
                                            createAutoLayoutViewController(),
                                            createManualViewController(),
                                            createViewControllerWithNavigation(),
                                            createViewControllerWithLargeNavigation()]
        
        tabBarController.tabBar.tintColor = .systemYellow
        return tabBarController
    }
}
