//
//  ViewController.swift
//  tusk7
//
//  Created by Никита Чирухин on 16.03.2022.
//

import UIKit

final class ViewController: UIViewController {
    
    private let reuseIdentifier = "TableViewCell"

    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(TableViewCell.self, forCellReuseIdentifier: reuseIdentifier)
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
        tableView.frame = view.bounds
        
        view.backgroundColor = .systemMint
    }
}

//MARK: - TableView Delegate

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = HeaderView(index: section, buttonText: MyData.myData[section].headerName)
        headerView.delegate = self
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        40
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
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! TableViewCell
        cell.textLabel?.text = MyData.myData[indexPath.section].subType[indexPath.row]
        return cell
    }
    
}

//MARK: - HeaderViewDelegate
extension ViewController: HeaderDelegate {
    func callHeader(idx: Int) {
        MyData.myData[idx].isExpandable = !MyData.myData[idx].isExpandable
        tableView.reloadSections([idx], with: .automatic)
    }

}
