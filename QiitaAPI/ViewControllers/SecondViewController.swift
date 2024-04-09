//
//  SecondViewController.swift
//  QiitaAPI
//
//  Created by 井本智博 on 2024/04/06.
//

import UIKit

class SecondViewController: UIViewController {

    private weak var tableView: UITableView! {
        didSet {
            tableView.register(CustomTableViewCell.self, forCellReuseIdentifier: CustomTableViewCell.reuseID)        }
    }

    private var qiitaItems: [QiitaItemModel] = []


    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blue
        let tableView = UITableView()
        view.addSubview(tableView)
        tableView.frame = view.bounds
        tableView.delegate = self
        tableView.dataSource = self

        DLog()
        API.shared.getItems { result in
            print(result)
            switch result {
            case.success(let items):
                self.qiitaItems = items
                DispatchQueue.main.async {
                    self.tableView?.reloadData()
                }
            case.failure(let error):
                DLog(error)
            }
        }
    }
}

extension SecondViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return qiitaItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CustomTableViewCell
        cell.titleLabel.text = qiitaItems[indexPath.row].title
        cell.urlLabel.text = qiitaItems[indexPath.row].url
        return cell
    }
}
