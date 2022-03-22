//
//  ViewController.swift
//  task8
//
//  Created by Никита Чирухин on 15.03.2022.
//

import UIKit

final class ViewController: UIViewController {
    
    private let reuseIdentifier = "Cell"
    
    private var data = MyData()

    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(CustomTableViewCell.self, forCellReuseIdentifier: reuseIdentifier)
        tableView.backgroundColor = .systemPurple
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setup()
    }


}

//MARK: - ViewConroller private methods
extension ViewController {
    
    private func setup() {
        view.addSubview(tableView)
        
        view.backgroundColor = .systemPurple
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 5),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 5),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -5),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

//MARK: - TableView delegate
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = CustomTableViewHeader(index: section, headerText: data.teamData[section].teamName)
        headerView.delegate = self
        if data.teamData[section].isExpandable {
            headerView.changeChevronDirection()
        }
        return headerView
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        data.teamData.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if data.teamData[section].isExpandable {
            return data.teamData[section].teamLineUp.count
        } else {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if data.teamData[indexPath.section].isExpandable {
            return 40
        } else {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        50
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = self.tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as? CustomTableViewCell {
            cell.textLabel?.text = data.teamData[indexPath.section].teamLineUp[indexPath.row]
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool
    {
        return true
    }

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath)
    {
        if editingStyle == .delete
        {
            data.teamData[indexPath.section].teamLineUp.remove(at: indexPath.row)
            tableView.reloadSections([indexPath.section], with: .automatic)
        }
    }
    
    override func setEditing(_ editing: Bool, animated: Bool) {
        super.setEditing(editing, animated: animated)
        tableView.setEditing(editing, animated: animated)
    }
}

//MARK: - Header Delegate in ViewController
extension ViewController: HeaderDelegate {
    func callHeader(idx: Int) {
        data.teamData[idx].isExpandable = !data.teamData[idx].isExpandable
        tableView.reloadSections([idx], with: .automatic)
    }
}

