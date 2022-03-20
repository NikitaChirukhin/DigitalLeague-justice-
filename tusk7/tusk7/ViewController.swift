//
//  ViewController.swift
//  tusk7
//
//  Created by Никита Чирухин on 16.03.2022.
//

import UIKit

final class ViewController: UIViewController {
    
    private let reuseIdentifier = "TableViewCell"
    
    private let imageWidth = 90

    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(TableViewCell.self, forCellReuseIdentifier: reuseIdentifier)
        tableView.backgroundColor = .tableViewBackGroundColor
        tableView.layer.shadowColor = UIColor.lightGray.cgColor
        tableView.layer.shadowOpacity = 0.6
        tableView.layer.shadowRadius = 3
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
    }
    
}

//MARK: - ViewController private methods
extension ViewController {
    
    private func setup() {
        view.addSubview(tableView)
        
        view.backgroundColor = .tableViewBackGroundColor
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 5),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -5),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

//MARK: - TableView Delegate

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = HeaderView(index: section, headerText: MyData.myData[section].headerName)
        headerView.delegate = self
        if MyData.myData[section].isExpandable {
            headerView.changeChevronDirection()
        }
        return headerView
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        MyData.myData.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if MyData.myData[section].isExpandable {
            return MyData.myData[section].subType.count
        } else {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if MyData.myData[indexPath.section].isExpandable {
            return 90
        } else {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        50
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = self.tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as? TableViewCell {
            cell.dataForCell(coverName: MyData.myData[indexPath.section].subType[indexPath.row],
                             rating: "5",
                             image: nil)
            return cell
        }
        return UITableViewCell()
    }
}

//MARK: - HeaderViewDelegate
extension ViewController: HeaderDelegate {
    func callHeader(idx: Int) {
        MyData.myData[idx].isExpandable = !MyData.myData[idx].isExpandable
        tableView.reloadSections([idx], with: .automatic)
    }
}
