//
//  CadastroScreen.swift
//  AppLogin
//
//  Created by user226298 on 1/10/23.
//

import UIKit

protocol CadastroScreenDelegate: AnyObject {
    func tappedCadastrarButton()
}

class CadastroScreen: UIView {
    
    private weak var delegate: CadastroScreenDelegate?
    
    public func delegate(delegate: CadastroScreenDelegate?){
        self.delegate = delegate
    }

    lazy var titleCadastroLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Faça o Cadastro abaixo"
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 30)
        
        return label
    }()
    
    lazy var emailCadastroLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Digite seu email"
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 20)
        
        return label
    }()
    
    lazy var userCadastroTextField: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.placeholder = "Digite seu Email para cadastro"
        tf.textColor = .blue
        tf.backgroundColor = .white
        tf.textContentType = .emailAddress
        tf.font = UIFont.boldSystemFont(ofSize: 20)
        
        return tf
    }()
    
    lazy var passCadastroLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Digite sua senha"
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 20)
        
        return label
    }()
    
    lazy var passCadastroTextField: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.placeholder = "Digite sua senha para cadastro"
        tf.textColor = .blue
        tf.backgroundColor = .white
        tf.isSecureTextEntry = true
        tf.font = UIFont.boldSystemFont(ofSize: 20)
        
        return tf
    }()
    
    lazy var cadastrarButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Cadastrar", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 30)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 8
        button.clipsToBounds = true
        button.backgroundColor = .blue
        button.addTarget(self, action: #selector(tappedCadastrarButton), for: .touchUpInside)
        
        return button
    }()
    
   @objc func tappedCadastrarButton(){
        delegate?.tappedCadastrarButton()
    }
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .red
        addSubview(titleCadastroLabel)
        addSubview(emailCadastroLabel)
        addSubview(userCadastroTextField)
        addSubview(passCadastroLabel)
        addSubview(passCadastroTextField)
        addSubview(cadastrarButton)
        configConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configConstraints(){
        NSLayoutConstraint.activate([
            titleCadastroLabel.topAnchor.constraint(equalTo: topAnchor, constant: 100),
            titleCadastroLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            titleCadastroLabel.heightAnchor.constraint(equalToConstant: 40),
            
            emailCadastroLabel.topAnchor.constraint(equalTo: titleCadastroLabel.bottomAnchor, constant: 50),
            emailCadastroLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            emailCadastroLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            
            userCadastroTextField.topAnchor.constraint(equalTo: emailCadastroLabel.bottomAnchor, constant: 10),
            userCadastroTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            userCadastroTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            userCadastroTextField.heightAnchor.constraint(equalToConstant: 45),
            
            passCadastroLabel.topAnchor.constraint(equalTo: userCadastroTextField.bottomAnchor, constant: 10),
            passCadastroLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            passCadastroLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            
            passCadastroTextField.topAnchor.constraint(equalTo: passCadastroLabel.bottomAnchor, constant: 10),
            passCadastroTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            passCadastroTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            passCadastroTextField.heightAnchor.constraint(equalToConstant: 45),
            
            cadastrarButton.topAnchor.constraint(equalTo: passCadastroTextField.bottomAnchor, constant: 50),
            cadastrarButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 40),
            cadastrarButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -40),
            cadastrarButton.heightAnchor.constraint(equalToConstant: 40),
            
            
        ])
    }
}
