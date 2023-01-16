//
//  ParabensVC.swift
//  AppLogin
//
//  Created by user226298 on 1/10/23.
//

import UIKit

class ParabensVC: UIViewController {
    
    lazy var parabensLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Parabéns André você é\n Hardsys mesmo"
        label.textColor = .green
        label.font = UIFont.boldSystemFont(ofSize: 35)
        label.numberOfLines = 2
        label.textAlignment = .center
        
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .yellow
        view.addSubview(parabensLabel)
        configConstraints()

    }
    private func configConstraints(){
        NSLayoutConstraint.activate([
            parabensLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 300),
            parabensLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            parabensLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        ])
    }

}
