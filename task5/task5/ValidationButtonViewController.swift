//
//  ViewController.swift
//  task5
//
//  Created by Никита Чирухин on 01.03.2022.
//

import UIKit

class ValidationButtonViewController: UIViewController {
    
    private let builder: Builder
    
    private lazy var emailButton: ValidationButton = {
        let button = ValidationButton(buttonText: "Email")
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(buttonTap), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        setupView()
    }

    init(builder: Builder){
        self.builder = builder
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension ValidationButtonViewController {
    private func setupView() {
        view.addSubview(emailButton)
        
        NSLayoutConstraint.activate([
            emailButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 260),
            emailButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -260),
            emailButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            emailButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50)
        ])
    }
    
    
    @objc private func buttonTap(sender: UIButton) {
        guard let key = sender.title(for: .normal) else { return }
        if key == "Email" {
            builder.pushValidationView(key: key)
        }
    }
}
