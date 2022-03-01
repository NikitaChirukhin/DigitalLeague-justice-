//
//  ViewController.swift
//  task3
//
//  Created by Никита Чирухин on 22.02.2022.
//

import UIKit

class ViewController: UIViewController {
    lazy var nameValidationView: ValidationView = {
        let view = ValidationView(validationTargetName: "FullName")
        view.delegate = self
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var emailValidationView: ValidationView = {
        let view = ValidationView(validationTargetName: "Email")
        view.delegate = self
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
        setupConstraints()
    }
}

//MARK: - ViewController Private methods

extension ViewController: ValidationViewDelegate {
    
    private func setupView() {
        view.backgroundColor = .systemBackground
        view.addSubview(nameValidationView)
        view.addSubview(emailValidationView)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            nameValidationView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            nameValidationView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            nameValidationView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            nameValidationView.heightAnchor.constraint(equalToConstant: 150),
            
            emailValidationView.topAnchor.constraint(equalTo: nameValidationView.bottomAnchor, constant: 50),
            emailValidationView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            emailValidationView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            emailValidationView.heightAnchor.constraint(equalToConstant: 150)
        ])
    }
    
    func didTapOnValidationButton(validationText: String, validationTarget: String) -> Bool {
        
        var isValid = false
        
        if validationTarget == "FullName" {
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
