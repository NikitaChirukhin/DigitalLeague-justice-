//
//  ViewController.swift
//  task5
//
//  Created by Никита Чирухин on 01.03.2022.
//

import UIKit

class ValidationButtonViewController: UIViewController {
    
    private lazy var emailButton: ValidationButton = {
        let button = ValidationButton(buttonText: "Email")
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(buttonTap), for: .touchUpInside)
        return button
    }()
    
    private lazy var nameButton: ValidationButton = {
        let button = ValidationButton(buttonText: "Name")
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(buttonTap), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        setupView()
    }
}

extension ValidationButtonViewController {
    
    private func setupView() {
        view.addSubview(emailButton)
        view.addSubview(nameButton)
        
        NSLayoutConstraint.activate([
            nameButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 150),
            nameButton.heightAnchor.constraint(equalToConstant: 50),
            nameButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            nameButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            
            emailButton.topAnchor.constraint(equalTo: nameButton.bottomAnchor, constant: 50),
            emailButton.heightAnchor.constraint(equalToConstant: 50),
            emailButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            emailButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
        ])
    }
    
    @objc private func buttonTap(sender: UIButton) {
        guard let key = sender.title(for: .normal) else { return }
        if key == "Email" {
            let validationViewController = ValidationViewController(key: key)
            navigationController?.pushViewController(validationViewController, animated: true)
        }
        if key == "Name" {
            let validationViewController = ValidationViewController(key: key)
            navigationController?.present(validationViewController, animated: true)
        }
    }
}
