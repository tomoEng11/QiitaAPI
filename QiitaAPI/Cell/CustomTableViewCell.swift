//
//  CustomTableViewCell.swift
//  QiitaAPI
//
//  Created by 井本智博 on 2024/04/07.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    static let reuseID = "cell"

    let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let urlLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(urlLabel)
        contentView.addSubview(titleLabel)

        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            titleLabel.heightAnchor.constraint(equalToConstant: 30),
            titleLabel.widthAnchor.constraint(equalToConstant: 100),

            urlLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            urlLabel.leadingAnchor.constraint(equalTo: titleLabel.trailingAnchor, constant: 20),
            urlLabel.heightAnchor.constraint(equalToConstant: 30),
            urlLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    


}
