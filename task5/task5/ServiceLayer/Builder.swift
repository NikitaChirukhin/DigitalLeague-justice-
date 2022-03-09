//
//  Builder.swift
//  task5
//
//  Created by Никита Чирухин on 02.03.2022.
//

import UIKit

protocol BuilderProtocol {
    func createValidationViewController() -> UIViewController
    func pushValidationView(key: String) -> UIViewController
}

class Builder: BuilderProtocol {
    
    var navigationController: UINavigationController
    
    func createValidationViewController() -> UIViewController {
        let viewController = ValidationButtonViewController(builder: self)
        navigationController = UINavigationController(rootViewController: viewController)
        return navigationController
    }
    
    func pushValidationView(key: String) -> UIViewController {
        
        return ValidationViewController(key: key)
    }
}
