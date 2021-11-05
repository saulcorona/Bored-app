//
//  CategoriesViewController.swift
//  BoretApp
//
//  Created by Saul Corona Santos on 04/11/21.
//

import UIKit

class CategoriesViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    private var categories: [String] = [
        "Education",
        "Recreational",
        "Social",
        "Diy",
        "Charity",
        "Cooking",
        "Relaxation",
        "Music",
        "BusyWork",
        "Raise Error!"
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.rowHeight = UITableView.automaticDimension
        tableView.rowHeight = 80
        tableView.tableFooterView = UIView()
    }
    
    private func getCategories(){
        tableView.reloadData()
    }
    
}


extension CategoriesViewController: UITableViewDataSource, UITableViewDelegate {
    
    // MARK: - UITableViewDelegate
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
            showQuestions(for: categories[indexPath.row])
    }
    
    // MARK: - UITableViewDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
           return categories.count.self
    }
       
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = categories[indexPath.row]
        cell.accessoryType = .disclosureIndicator
        if categories[indexPath.row] == "Raise Error!" {
            cell.textLabel?.textColor = .red
        }
        return cell
    }
    
    private func showQuestions(for type: String) {
        let activityViewController = ActivityViewController(nibName: "ActivityViewController", bundle: nil)
        activityViewController.title = type
        activityViewController.typeActivity = type.lowercased()
        activityViewController.fromRandom = false
        navigationController?.pushViewController(activityViewController, animated: true)
    }
}
