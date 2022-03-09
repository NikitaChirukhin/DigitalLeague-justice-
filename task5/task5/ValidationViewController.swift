//
//  EmailValidationViewController.swift
//  task5
//
//  Created by Никита Чирухин on 02.03.2022.
//

import UIKit

class ValidationViewController: UIViewController {
    
    private let key: String
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemPink
    }
    
    init(key: String) {
        self.key = key
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
