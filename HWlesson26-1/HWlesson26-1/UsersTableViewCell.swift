//
//  UsersTableViewCell.swift
//  HWlesson26
//
//  Created by Карина Дьячина on 12.03.24.
//

import UIKit
class UsersTableViewCell: UITableViewCell {
    
    lazy var nameLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        return titleLabel
    }()
    
    lazy var userNameLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        return titleLabel
    }()
    
    lazy var emailLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        return titleLabel
    }()
    
    lazy var addressLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.numberOfLines = 2
        return titleLabel
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupLabels()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func setupLabels() {
        addSubview(nameLabel)
        addSubview(userNameLabel)
        addSubview(emailLabel)
        addSubview(addressLabel)
        
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 15),
            nameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            nameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            
            userNameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            userNameLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 15),
            userNameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            
            emailLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            emailLabel.topAnchor.constraint(equalTo: userNameLabel.bottomAnchor, constant: 10),
            emailLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            
            addressLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            addressLabel.topAnchor.constraint(equalTo: emailLabel.bottomAnchor, constant: 10),
            addressLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10)
        ])
    }
    
    func configure(users: Users) {
        nameLabel.text = "Name: \(users.name)"
        userNameLabel.text = "UserName: \(users.username)"
        emailLabel.text = "Email: \(users.email)"
        addressLabel.text = "Adress: \(users.address)"
    }
}

