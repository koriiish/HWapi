//
//  UsersTableViewCell.swift
//  HWlesson26-1
//
//  Created by Карина Дьячина on 12.03.24.
//

import Foundation
import UIKit

class UsersTableViewCell: UITableViewCell {
    
    lazy var nameLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        return titleLabel
    }()
    
    lazy var usernameLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        return titleLabel
    }()
    
    lazy var emailLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        return titleLabel
    }()
    
    lazy var adressLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        return titleLabel
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupLabel()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func setupLabel() {
        addSubview(nameLabel)
        addSubview(usernameLabel)
        addSubview(emailLabel)
        addSubview(adressLabel)
        
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 15),
            nameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            
            usernameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            usernameLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 15),
            
            emailLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            emailLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 10),
            
            adressLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            adressLabel.topAnchor.constraint(equalTo: emailLabel.bottomAnchor, constant: 10)
        ])
    }
    
    func configure(users: Users) {
        nameLabel.text = users.name
        usernameLabel.text = users.username
        emailLabel.text = users.email
        adressLabel.text = users.adress
    }
}