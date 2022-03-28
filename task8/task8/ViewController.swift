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
        tableView.backgroundColor = .secondarySystemFill
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
        //MARK: - Navigation Item
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Add", style: .plain, target: self, action: #selector(addButtonTap))
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Edit", style: .plain, target: self, action: #selector(editButtonTap))
        
        view.backgroundColor = .systemBackground
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 5),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 5),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -5),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -5)
        ])
    }
    
    @objc private func addButtonTap() {
        let addAlertController = createAddAlertController()
        self.present(addAlertController, animated: true, completion: nil)
        tableView.reloadData()
    }
    
    @objc private func editButtonTap() {
        if (tableView.isEditing == true) {
            tableView.isEditing = false
            navigationItem.leftBarButtonItem?.title = "Edit"
        } else {
            tableView.isEditing = true
            navigationItem.leftBarButtonItem?.title = "Done"
        }
    }
    
    private func createAddAlertController() -> UIAlertController {
        let alertController = UIAlertController(title: "Add New Player", message: "", preferredStyle: .alert)
        alertController.addTextField { (textField : UITextField!) -> Void in
            textField.placeholder = "Player name"
        }
        alertController.addTextField { (textField : UITextField!) -> Void in
            textField.placeholder = "Team name or section number"
        }
        alertController.addAction(UIAlertAction(title: "Save", style: .default, handler: { [weak self] alert -> Void in
            guard let self = self else { return }
            let firstTextField = alertController.textFields![0] as UITextField
            let secondTextField = alertController.textFields![1] as UITextField
            if let idx = secondTextField.text, let text = firstTextField.text {
                if self.validation(validationText: text) {
                    if let teamIdx = Int(idx) {
                        if teamIdx <= self.data.teamData.count && teamIdx >= 1 {
                            self.data.teamData[teamIdx - 1].teamLineUp.append(text)
                            self.tableView.reloadSections([teamIdx - 1], with: .automatic)
                        } else {
                            self.cancelSaving(error: "No such team in table")
                        }
                    } else if let teamIdx = self.data.teamData.firstIndex(where: { $0.teamName == idx }) {
                        if teamIdx <= self.data.teamData.count && teamIdx >= 1 {
                            self.data.teamData[teamIdx - 1].teamLineUp.append(text)
                            self.tableView.reloadSections([teamIdx - 1], with: .automatic)
                        } else {
                            self.cancelSaving(error: "No such team in table")
                        }
                    } else {
                        self.cancelSaving(error: "Enter full information")
                    }
                } else {
                    self.cancelSaving(error: "Can't validate players name")
                }
            }
        }))
        alertController.addAction(UIAlertAction(title: "Cancel", style: .default, handler: nil ))
        return alertController
    }
    
    private func cancelSaving(error: String) {
        let alertController = UIAlertController(title: "Smth gone wrong", message: error, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Ok", style: .default, handler: { [weak self] alert -> Void in
            guard let self = self else { return }
            self.addButtonTap()
        }))
        self.present(alertController, animated: true, completion: nil)
    }
    
    private func validation(validationText: String) -> Bool {
        
        let regExString = "[A-Za-zА-ЯЁа-яё-]{2,}+\\s{1}+[A-Za-zА-ЯЁа-яё-]{2,}"
        let predicate = NSPredicate(format: "SELF MATCHES[c] %@", regExString)
        let isValid = predicate.evaluate(with: validationText)
        return isValid
    }
}

//MARK: - TableView delegate
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    //MARK: - TableView Setup
    func numberOfSections(in tableView: UITableView) -> Int {
        data.teamData.count
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        50
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = self.tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as? CustomTableViewCell {
            cell.textLabel?.text = data.teamData[indexPath.section].teamLineUp[indexPath.row]
            cell.selectionStyle = .none
            return cell
        }
        return UITableViewCell()
    }
    
    //MARK: - Expandable Section
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = CustomTableViewHeader(index: section,
                                               headerText: data.teamData[section].teamName)
        headerView.delegate = self
        if data.teamData[section].isExpandable {
            headerView.changeChevronDirection()
        }
        return headerView
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
    
    //MARK: - able to delete cells
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
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
    
    //MARK: - able to drag cells
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let playerData = data.teamData[sourceIndexPath.section].teamLineUp[sourceIndexPath.row]
        data.teamData[destinationIndexPath.section].teamLineUp.insert(playerData, at: destinationIndexPath.row)
        data.teamData[sourceIndexPath.section].teamLineUp.remove(at: sourceIndexPath.row)
    }
}

//MARK: - Header Delegate in ViewController
extension ViewController: HeaderDelegate {
    func callHeader(idx: Int) {
        data.teamData[idx].isExpandable = !data.teamData[idx].isExpandable
        tableView.reloadSections([idx], with: .automatic)
    }
}

