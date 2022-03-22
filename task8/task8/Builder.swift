//
//  Builder.swift
//  task8
//
//  Created by Никита Чирухин on 20.03.2022.
//

import UIKit

final class Builder {
    func createViewController() -> UIViewController {
        let viewController = ViewController()
        let navigationController = UINavigationController(rootViewController: viewController)
        return navigationController
    }
}

