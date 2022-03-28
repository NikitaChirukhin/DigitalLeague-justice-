//
//  CustomTableViewCell.swift
//  task8
//
//  Created by Никита Чирухин on 22.03.2022.
//

import UIKit

final class CustomTableViewCell: UITableViewCell {
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


//MARK: - Private Methods
extension CustomTableViewCell {
    private func setup() {
        
        frame = CGRect(x: frame.minX + 5,
                       y: frame.midY + 5,
                       width: 50,
                       height: 50)
        backgroundColor = .systemGray2
    }
}
