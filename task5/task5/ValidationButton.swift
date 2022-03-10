//
//  ValidationButton.swift
//  task5
//
//  Created by Никита Чирухин on 01.03.2022.
//

import UIKit

class ValidationButton: UIButton {
    
    init(buttonText: String){
        super.init(frame: .zero)
        
        setupButton(buttonText: buttonText)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupButton(buttonText: String) {
        
        backgroundColor = .systemMint
        layer.cornerRadius = 15
        setTitle(buttonText, for: .normal)
    }
}
