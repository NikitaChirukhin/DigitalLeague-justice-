//
//  EmailValidationViewController.swift
//  task5
//
//  Created by Никита Чирухин on 02.03.2022.
//

import UIKit

class ValidationViewController: UIViewController {
    
    private let key: String
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
    }
    
    override func loadView() {
        super.loadView()
        
        view = ReplacementViewForValidationViewController(key: key)
    }
    
    init(key: String) {
        self.key = key
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK: - ValidationViewDelegateMethod

extension ValidationViewController: ValidationViewDelegate {
    
    func didTapOnValidationButton(validationText: String, validationTarget: String) -> Bool {
        
        var isValid = false
        
        if validationTarget == "Name" {
            let regExString = "[A-Za-zА-ЯЁа-яё-]{2,}+\\s{1}+[A-Za-zА-ЯЁа-яё-]{2,}"
            let predicate = NSPredicate(format: "SELF MATCHES[c] %@", regExString)
            isValid = predicate.evaluate(with: validationText)
        }
        
        if validationTarget == "Email" {
            let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
            let predicate = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
            isValid = predicate.evaluate(with: validationText)
        }
        
        return isValid
    }
}
