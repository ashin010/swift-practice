//
//  SATVC.swift
//  NYCSchool
//
//  Created by Consultant on 7/7/22.
//

import UIKit

class SATVC: UIViewController {

    let school: School

    private let schoolNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.textAlignment = .left
        label.textColor = .blue
        label.font = UIFont.systemFont(ofSize: 18)
        return label
    }()

    private let WritingLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.textAlignment = .left
        return label
    }()

    private let MathLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.textAlignment = .left
        return label
    }()

    private let ReadingLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.textAlignment = .left
        return label
    }()
    
    init(school: School) {
        self.school = school
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        setUp()
        populateUI()


    }

    private func setUp() {

        view.backgroundColor = .white
        view.addSubview(schoolNameLabel)
        view.addSubview(MathLabel)
        view.addSubview(ReadingLabel)
        view.addSubview(WritingLabel)

        NSLayoutConstraint.activate([
            schoolNameLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8),
            schoolNameLabel.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 8),
            schoolNameLabel.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -8),
            MathLabel.topAnchor.constraint(equalTo: schoolNameLabel.bottomAnchor, constant: 8),
            MathLabel.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 8),
            MathLabel.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -8),
            ReadingLabel.topAnchor.constraint(equalTo: MathLabel.bottomAnchor, constant: 8),
            ReadingLabel.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 8),
            ReadingLabel.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -8),
            WritingLabel.topAnchor.constraint(equalTo: ReadingLabel.bottomAnchor, constant: 8),
            WritingLabel.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 8),
            WritingLabel.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -8),

        ])
    }


    private func populateUI(){
        
        if let sat = school.sat {
            setUI(sat: sat)
            print("Already have data")
            return
        }
        
        print("Fetching data")
        NetworkAPI.schoolDetail(dbn: school.dbn) { [weak self] result in
            switch result {
            case .success(let sat):
                self?.school.sat = sat.first
                self?.setUI(sat: sat.first)

            case .failure(let error):
                let error = error
                print(error)
            }
        }


    }
    
    private func setUI(sat: SAT?) {
        schoolNameLabel.text = "Name: \(sat?.school_name ?? "Name Unavailable")"
        MathLabel.text = "Math Score: \(sat?.sat_math_avg_score ?? "Math Score Unavailable")"
        ReadingLabel.text = "Reading Score: \(sat?.sat_critical_reading_avg_score ?? "Reading Score Unavailable")"
        WritingLabel.text = "Writing Score: \(sat?.sat_writing_avg_score ?? "Writing Score Unavailable")"
    }




}
