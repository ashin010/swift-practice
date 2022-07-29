//
//  SchoolNameCell.swift
//  NYCSchool
//
//  Created by Consultant on 7/7/22.
//

import UIKit

class SchoolNameCell: UITableViewCell {
    
    static let ReuseID = "\(SchoolNameCell.self)"
    
    
    private var nameLabel: UILabel!
    private var overLabel: UILabel!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setUp()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUp() {
        
        nameLabel = UILabel()
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.numberOfLines = 0
        nameLabel.font = UIFont.systemFont(ofSize: 25)
        
        overLabel = UILabel()
        overLabel.translatesAutoresizingMaskIntoConstraints = false
        overLabel.numberOfLines = 3
        
        contentView.addSubview(nameLabel)
        contentView.addSubview(overLabel)
        
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            nameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            nameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            overLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 8),
            overLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            overLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            overLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
        ])
    }

    func configure(school: School) {
        nameLabel.text = school.school_name
        overLabel.text = school.overview_paragraph
    }
    

}
