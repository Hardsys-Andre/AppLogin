//
//  HomeLoginScreen.swift
//  AppLogin
//
//  Created by user226298 on 1/10/23.
//

import UIKit

protocol HomeLoginScreenDelegate: AnyObject{
    func tappedEntrarButton()
    func tappedCadastroButton()
}

class HomeLoginScreen: UIView {
    
    private weak var delegate: HomeLoginScreenDelegate?
    
    public func delegate(delegate: HomeLoginScreenDelegate?){
        self.delegate = delegate
    }

    
    lazy var titleLoginLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Faça o login abaixo"
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 30)
        
        return label
    }()
    
    lazy var emailLoginLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Digite seu Email"
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 20)
        
        return label
    }()
    
    lazy var userLoginTextField: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.placeholder = "Digite seu Email de Login"
        tf.textColor = .blue
        tf.backgroundColor = .white
        tf.textContentType = .emailAddress
        tf.font = UIFont.boldSystemFont(ofSize: 20)
        
        return tf
    }()
    
    lazy var passLoginLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Digite sua senha"
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 20)
        
        return label
    }()
    
    lazy var passLoginTextField: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.placeholder = "Digite sua senha de Login"
        tf.textColor = .blue
        tf.backgroundColor = .white
        tf.isSecureTextEntry = true
        tf.font = UIFont.boldSystemFont(ofSize: 20)

        
        return tf
    }()
    
    lazy var entrarButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Entrar", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 30)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 8
        button.clipsToBounds = true
        button.backgroundColor = .red
        button.addTarget(self, action: #selector(tappedEntrarButton), for: .touchUpInside)
        
        return button
    }()
    
    @objc func tappedEntrarButton(){
        delegate?.tappedEntrarButton()
    }
    
    lazy var cadastroButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Cadastre-se", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        button.setTitleColor(.white, for: .normal)
        button.clipsToBounds = true
        button.layer.cornerRadius = 8
        button.addTarget(self, action: #selector(tappedCadastroButton), for: .touchUpInside)
        
        return button
    }()
    
    @objc func tappedCadastroButton(){
        delegate?.tappedCadastroButton()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .blue
        addSubview(titleLoginLabel)
        addSubview(emailLoginLabel)
        addSubview(userLoginTextField)
        addSubview(passLoginLabel)
        addSubview(passLoginTextField)
        addSubview(entrarButton)
        addSubview(cadastroButton)
        configConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configConstraints(){
        NSLayoutConstraint.activate([
            titleLoginLabel.topAnchor.constraint(equalTo: topAnchor, constant: 100),
            titleLoginLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            titleLoginLabel.heightAnchor.constraint(equalToConstant: 40),
            
            emailLoginLabel.topAnchor.constraint(equalTo: titleLoginLabel.bottomAnchor, constant: 50),
            emailLoginLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            emailLoginLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            
            userLoginTextField.topAnchor.constraint(equalTo: emailLoginLabel.bottomAnchor, constant: 10),
            userLoginTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            userLoginTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            userLoginTextField.heightAnchor.constraint(equalToConstant: 45),
            
            passLoginLabel.topAnchor.constraint(equalTo: userLoginTextField.bottomAnchor, constant: 10),
            passLoginLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            passLoginLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            
            passLoginTextField.topAnchor.constraint(equalTo: passLoginLabel.bottomAnchor, constant: 10),
            passLoginTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            passLoginTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            passLoginTextField.heightAnchor.constraint(equalToConstant: 45),
            
            entrarButton.topAnchor.constraint(equalTo: passLoginTextField.bottomAnchor, constant: 50),
            entrarButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 40),
            entrarButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -40),
            entrarButton.heightAnchor.constraint(equalToConstant: 40),
            
            cadastroButton.topAnchor.constraint(equalTo: entrarButton.bottomAnchor, constant: 20),
            cadastroButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            cadastroButton.heightAnchor.constraint(equalToConstant: 40),
            
        ])
    }
}
