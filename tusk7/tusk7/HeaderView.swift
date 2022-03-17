//
//  HeaderView.swift
//  tusk7
//
//  Created by Никита Чирухин on 17.03.2022.
//

import UIKit

protocol HeaderDelegate: AnyObject {
    func callHeader(idx: Int)
}

final class HeaderView: UIView {
    
    weak var delegate: HeaderDelegate?
    private let index: Int
    private let buttonText: String
    
    private lazy var expendButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .systemRed
        button.addTarget(self, action: #selector(expendButtonTap), for: .touchUpInside)
        return button
    }()
    
    init(index: Int, buttonText: String){
        self.index = index
        self.buttonText = buttonText
        
        super.init(frame: .zero)
        
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension HeaderView {
    private func setup() {
        addSubview(expendButton)
        
        expendButton.setTitle(buttonText, for: .normal)
        
        NSLayoutConstraint.activate([
            expendButton.topAnchor.constraint(equalTo: topAnchor),
            expendButton.leadingAnchor.constraint(equalTo: leadingAnchor),
            expendButton.trailingAnchor.constraint(equalTo: trailingAnchor),
            expendButton.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    @objc private func expendButtonTap() {
        delegate?.callHeader(idx: index)
    }
}
