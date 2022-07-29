//
//  ViewController.swift
//  NYCSchool
//
//  Created by Consultant on 7/6/22.
//

import UIKit

class SchoolListVC: UIViewController {
    
    var list : [School] = [] {
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    private var tableView : UITableView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        tableView = UITableView()
        
        // Auto layout
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        tableView.register(SchoolNameCell.self, forCellReuseIdentifier: SchoolNameCell.ReuseID)
        
        tableView.dataSource = self
        tableView.delegate = self
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.leftAnchor.constraint(equalTo: view.leftAnchor),
            tableView.rightAnchor.constraint(equalTo: view.rightAnchor),
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
        
        
        NetworkAPI.homeSchoolNameList { [weak self] result in
            guard let self = self else {return}
            switch result {
            case .success(let schools):
                self.list = schools
            case .failure(let err):
                print(err)
            }
        }
        
        
        
    }
}

extension SchoolListVC: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: SchoolNameCell.ReuseID, for: indexPath) as? SchoolNameCell else {
            return UITableViewCell()
        }
        cell.configure(school: list[indexPath.row])
        return cell
    }
}

extension SchoolListVC: UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let satVC = SATVC(school: list[indexPath.row])
        navigationController?.pushViewController(satVC, animated: true)
    }
    
}
