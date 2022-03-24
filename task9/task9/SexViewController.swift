//
//  SexViewController.swift
//  task9
//
//  Created by Никита Чирухин on 22.03.2022.
//

import UIKit

class SexViewController: UIViewController {

    private lazy var dataModel = DataModel()
    
    private lazy var pickViews: [PickView] = []
    
    private lazy var pushResultViewControllerButton: UIButton = {
        let button = UIButton()
        button.setTitle("Next", for: .normal)
        button.backgroundColor = .secondarySystemFill
        button.addTarget(self, action: #selector(pushResultViewController), for: .touchUpInside)
        button.layer.cornerRadius = 10
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        setupFrames()
    }
}

//MARK: - Private methods
extension SexViewController {
    
    private func setupView() {
        view.backgroundColor = .systemBackground
        
        for i in 0...dataModel.pickViewModel.count - 1 {
            pickViews.append(makePickView(idx: i))
        }
        
        view.addSubview(pushResultViewControllerButton)
    }
    
    private func setupFrames() {
    
        let pushResultViewControllerButtonFrame = CGRect(x: 40,
                                         y: view.bounds.maxY - 60 - 10,
                                         width: UIScreen.main.bounds.width - 20 - 20 - 40,
                                         height: 30)
        pushResultViewControllerButton.frame = pushResultViewControllerButtonFrame
    }
    
    private func makePickView(idx: Int) -> PickView {
        let pickView = PickView(data: dataModel.pickViewModel[idx])
        pickView.frame = CGRect(x: 20,
                                y: 60 + 20 * idx + 50 * idx,
                                width: Int(UIScreen.main.bounds.width) - 20 - 20,
                                height: 50
        )
        view.addSubview(pickView)
        pickView.delegate = self
        return pickView
    }
    
    @objc private func pushResultViewController() {
        if let sexModel = dataModel.pickViewModel.first(where: { $0.isPicked == true }) {
            let resultViewController = ShowResultViewController(pickedSex: sexModel.sex)
            navigationController?.pushViewController(resultViewController, animated: true)
        }
    }
}

//MARK: - PickView delegate
extension SexViewController: PickViewDelegate {
    func viewPicked(pickViewName: String) {
        for i in 0...dataModel.pickViewModel.count - 1 {
            dataModel.pickViewModel[i].isPicked = false
        }
        if let pickedIndex = dataModel.pickViewModel.firstIndex(where: {$0.sex == pickViewName}) {
            dataModel.pickViewModel[pickedIndex].isPicked = true
            for (idx, pickView) in pickViews.enumerated() {
                pickView.isSelected = dataModel.pickViewModel[idx].isPicked
            }
        }
    }
}

