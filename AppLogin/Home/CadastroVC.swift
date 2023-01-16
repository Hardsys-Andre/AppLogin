//
//  CadastroVC.swift
//  AppLogin
//
//  Created by user226298 on 1/10/23.
//

import UIKit
import Firebase

class CadastroVC: UIViewController, CadastroScreenDelegate {
    
    var auth: Auth?
    var alert: Alert?

    override func viewDidLoad() {
        super.viewDidLoad()
        screen?.delegate(delegate: self)
        self.auth = Auth.auth()
        alert = Alert(controller: self)

    }
    
    var screen: CadastroScreen?
    
    override func loadView() {
        screen = CadastroScreen()
        view = screen
    }
    
    func tappedCadastrarButton() {
        
        let email: String = self.screen?.userCadastroTextField.text ?? ""
        let senha: String = self.screen?.passCadastroTextField.text ?? ""
        
        
        self.auth?.createUser(withEmail: email, password: senha, completion: { Result, error in
            if error != nil {
                self.alert?.alert(title: "Atenção", message: "Falha ao cadastrar")

            }else{
                self.alert?.alert(title: "Parabéns", message: "Cadastro realizado com sucesso")
            }
        })
    }
}
