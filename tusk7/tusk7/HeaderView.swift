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
    private let headerText: String
    
    private lazy var genreLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "HoeflerText-Black", size: 25)
        label.textColor = .white
        return label
    }()
    
    private lazy var expendButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(expendButtonTap), for: .touchUpInside)
        button.setImage(UIImage(systemName: "chevron.down"), for: .normal)
        button.tintColor = .white
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

extension HeaderView {
    private func setup() {
        addSubview(expendButton)
        addSubview(genreLabel)
        
        genreLabel.text = headerText
        backgroundColor = .tableViewBackGroundColor
        layer.borderColor = UIColor.white.cgColor
        layer.borderWidth = 1
        layer.cornerRadius = 10
        
        NSLayoutConstraint.activate([
            expendButton.topAnchor.constraint(equalTo: topAnchor),
            expendButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
            expendButton.widthAnchor.constraint(equalToConstant: 50),
            expendButton.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            genreLabel.topAnchor.constraint(equalTo: topAnchor),
            genreLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            genreLabel.trailingAnchor.constraint(equalTo: expendButton.leadingAnchor, constant: -10),
            genreLabel.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    @objc private func expendButtonTap() {
        delegate?.callHeader(idx: index)
    }
}

extension HeaderView {
    func changeChevronDirection() {
        expendButton.transform = CGAffineTransform(rotationAngle: CGFloat.pi)
    }
}
