//
//  NameValidationView.swift
//  task3
//
//  Created by Никита Чирухин on 22.02.2022.
//

import UIKit

protocol ValidationViewDelegate: AnyObject {
    func didTapOnValidationButton(validationText: String, validationTarget: String) -> Bool
}

class ValidationView: UIView {
    
    weak var delegate: ValidationViewDelegate?
    
    private lazy var textField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = .systemBackground
        textField.borderStyle = .roundedRect
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private lazy var validationResultLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Waiting..."
        return label
    }()
    
    private lazy var validationButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Validate", for: .normal)
        button.setTitle("STOP", for: .highlighted)
        button.titleLabel?.font = .systemFont(ofSize: 18, weight: .bold)
        button.backgroundColor = .systemMint
        button.layer.cornerRadius = 4
        button.addTarget(self, action: #selector(tapeOnButton), for: .touchUpInside)
        return button
    }()
    
    init(validationTargetName: String) {
        super.init(frame: .zero)
        
        backgroundColor = .secondarySystemBackground
        layer.cornerRadius = 12
        
        setUpView()
        setUpConstraint()
        
        textField.placeholder = validationTargetName
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK: - ValidationView Private methods

extension ValidationView {
    
    @objc private func tapeOnButton() {
        let isValid = delegate?.didTapOnValidationButton(validationText: textField.text ?? "", validationTarget: textField.placeholder ?? "")
        if isValid != nil && isValid == true {
            validationResultLabel.text = "Success.."
            validationResultLabel.textColor = .systemGreen
        } else {
            validationResultLabel.text = "Wrong validation.."
            validationResultLabel.textColor = .systemRed
        }
    }
    
    private func setUpView() {
        addSubview(textField)
        addSubview(validationButton)
        addSubview(validationResultLabel)
    }
    
    private func setUpConstraint() {
        NSLayoutConstraint.activate([
            textField.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 16),
            textField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            textField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            
            validationButton.topAnchor.constraint(equalTo: textField.bottomAnchor, constant: 16),
            validationButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            validationButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            
            validationResultLabel.topAnchor.constraint(equalTo: validationButton.bottomAnchor, constant: 16),
            validationResultLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            validationResultLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            validationResultLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16)
        ])
    }
}
