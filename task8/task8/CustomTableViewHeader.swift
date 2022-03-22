//
//  CustomTableViewHeader.swift
//  task8
//
//  Created by Никита Чирухин on 22.03.2022.
//

import UIKit

protocol HeaderDelegate: AnyObject {
    func callHeader(idx: Int)
}

final class CustomTableViewHeader: UIView {
    
    weak var delegate: HeaderDelegate?
    private let index: Int
    private let headerText: String
    
    private lazy var playerLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "AmericanTypewriter", size: 25)
        label.textColor = .black
        return label
    }()
    
    private lazy var expendButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(expendButtonTap), for: .touchUpInside)
        button.setImage(UIImage(systemName: "chevron.down"), for: .normal)
        button.tintColor = .black
        return button
    }()
    
    init(index: Int, headerText: String){
        self.index = index
        self.headerText = headerText

        super.init(frame: .zero)
        
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}


//MARK: HeaderView Private Methods
extension CustomTableViewHeader {
    private func setup() {
        addSubview(expendButton)
        addSubview(playerLabel)
        
        playerLabel.text = headerText
        backgroundColor = .systemGray
        layer.cornerRadius = 10
        
        NSLayoutConstraint.activate([
            expendButton.topAnchor.constraint(equalTo: topAnchor),
            expendButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
            expendButton.widthAnchor.constraint(equalToConstant: 50),
            expendButton.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            playerLabel.topAnchor.constraint(equalTo: topAnchor),
            playerLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            playerLabel.trailingAnchor.constraint(equalTo: expendButton.leadingAnchor, constant: -10),
            playerLabel.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    @objc private func expendButtonTap() {
        delegate?.callHeader(idx: index)
    }
}

extension CustomTableViewHeader {
    func changeChevronDirection() {
        expendButton.transform = CGAffineTransform(rotationAngle: CGFloat.pi)
    }
}
