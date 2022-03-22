//
//  TableViewCell.swift
//  tusk7
//
//  Created by Никита Чирухин on 17.03.2022.
//

import UIKit

final class TableViewCell: UITableViewCell {
    
    private lazy var albumCoverImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(systemName: "trash")
        imageView.tintColor = .black
        return imageView
    }()
    
    private lazy var albumCoverLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "HoeflerText-Black", size: 25)
        return label
    }()
    
    private lazy var ratingLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var addButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "plus"), for: .normal)
        button.tintColor = .white
        button.backgroundColor = .cellTableViewBackGroundColor
        button.layer.cornerRadius = 9
        return button
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK: - TableViewCell private methods
extension TableViewCell {
    private func setup() {
        addSubview(albumCoverImage)
        addSubview(albumCoverLabel)
        addSubview(ratingLabel)
        addSubview(addButton)

        backgroundColor = .cellTableViewBackGroundColor
        selectionStyle = .none
        layer.cornerRadius = 10
        layer.borderWidth = 1
        layer.backgroundColor = UIColor.white.cgColor
        
        NSLayoutConstraint.activate([
            albumCoverImage.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            albumCoverImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            albumCoverImage.widthAnchor.constraint(equalToConstant: 60),
            albumCoverImage.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
            
            albumCoverLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            albumCoverLabel.leadingAnchor.constraint(equalTo: albumCoverImage.trailingAnchor, constant: 10),
            albumCoverLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            albumCoverLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
            
            addButton.heightAnchor.constraint(equalToConstant: 30),
            addButton.widthAnchor.constraint(equalToConstant: 50),
            addButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
            addButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -15),
            
            ratingLabel.heightAnchor.constraint(equalToConstant: 30),
            ratingLabel.widthAnchor.constraint(equalToConstant: 50),
            ratingLabel.trailingAnchor.constraint(equalTo: addButton.leadingAnchor),
            ratingLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -15)
        ])
    }
}

//MARK: - TableViewCell methods
extension TableViewCell {
    func dataForCell(coverName: String, rating: String, image: UIImage?) {
        albumCoverLabel.text = coverName
        ratingLabel.text = "\(rating) \u{2730}"
        if let newImage = image {
            albumCoverImage.image = newImage
        }
    }
}
