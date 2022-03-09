//
//  Router.swift
//  task5
//
//  Created by Никита Чирухин on 02.03.2022.
//

import UIKit

protocol RouterProtocol {
    func pushViewController()
}

class Router: RouterProtocol {
    
    private let navigationController: UINavigationController
    private let builder: Builder
    
    func pushViewController() {
//        navigationController.pushViewController(<#T##viewController: UIViewController##UIViewController#>, animated: <#T##Bool#>)
    }
    
    init(navigationController: UINavigationController, builder: Builder) {
        self.navigationController = navigationController
        self.builder = builder
    }
}
