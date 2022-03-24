//
//  PickView.swift
//  task9
//
//  Created by Никита Чирухин on 23.03.2022.
//

import UIKit

protocol PickViewDelegate: AnyObject {
    func viewPicked(pickViewName: String)
}

final class PickView: UIView {
    
    weak var delegate: PickViewDelegate?
    
    var isSelected: Bool = false {
        didSet {
            isSelected ? viewSelected() : viewUnSelected()
        }
    }
    
    private lazy var sexLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    private lazy var layerView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .systemPink
        return imageView
    }()
    
    init(data: PickViewModel){
        super.init(frame: .zero)
        
        sexLabel.text = data.sex
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

//MARK: - PickView private methods
extension PickView {
    
    private func setupView() {
    
        layer.cornerRadius = 12
        backgroundColor = .systemBlue
        
        clickable()
        
        addSubview(layerView)
        addSubview(sexLabel)
        
        layerView.frame = CGRect(x: bounds.maxX + 10,
                                 y: bounds.midY + 10,
                                 width: 30,
                                 height: 30)
        sexLabel.frame = CGRect(x: layerView.bounds.maxX + 15,
                                y: bounds.midY + 10,
                                width: 150,
                                height: 30)
    }
    
    private func clickable() {
        isUserInteractionEnabled = true
        let tap = UITapGestureRecognizer(target: self, action: #selector(selected))
        addGestureRecognizer(tap)
    }
    
    @objc private func selected() {
        delegate?.viewPicked(pickViewName: sexLabel.text ?? "")
    }
    
    private func viewSelected() {
        tintColor = .green
        layer.borderWidth = 2
        layer.borderColor = .init(red: 0, green: 1, blue: 0, alpha: 1)
        layerView.tintColor = .green
        layerView.image = .checkmark
    }
    
    private func viewUnSelected() {
        layer.borderWidth = 0
        layerView.tintColor = .red
    }
}
