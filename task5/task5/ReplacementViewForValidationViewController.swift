//
//  ReplacementForValidationViewController.swift
//  task5
//
//  Created by Никита Чирухин on 10.03.2022.
//

import UIKit

class ReplacementViewForValidationViewController: UIView {
    
    private let key: String
    
    private lazy var validationView: ValidationView = {
        let view = ValidationView(validationTargetName: key)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    init(key: String){
        self.key = key
        
        super.init(frame: .zero)
        
        setupView()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK: - ViewController Private methods

extension ReplacementViewForValidationViewController {
    
    func setDelegate(delegate: ValidationViewDelegate) {
        validationView.delegate = delegate
    }
    
    private func setupView() {
        backgroundColor = .systemBackground
        addSubview(validationView)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            validationView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20),
            validationView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            validationView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            validationView.heightAnchor.constraint(equalToConstant: 150),
        ])
    }
}
