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
            tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        }
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
            switch result {
            case.success(let items):
                self.qiitaItems = items
                DLog(qiitaItems)
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = qiitaItems[indexPath.row].title
        return cell
    }
}
