//
//  ShowResultViewController.swift
//  task9
//
//  Created by Никита Чирухин on 24.03.2022.
//

import UIKit

final class ShowResultViewController: UIViewController {
    
    private lazy var resultLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
    }
    
    init(pickedSex: String) {
        super.init(nibName: nil, bundle: nil)
        
        resultLabel.text = pickedSex
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

//MARK: - Private ShowResultViewController methods
extension ShowResultViewController {
    
    private func setupView() {
        view.backgroundColor = .systemBackground
        
        view.addSubview(resultLabel)

        resultLabel.frame = CGRect(x: UIScreen.main.bounds.width/2 - UIScreen.main.bounds.width/4,
                                   y: view.safeAreaInsets.top + 50,
                                   width: UIScreen.main.bounds.width/2,
                                   height: 60)
    }
}
