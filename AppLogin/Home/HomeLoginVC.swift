//
//  HomeLoginVC.swift
//  AppLogin
//
//  Created by user226298 on 1/10/23.
//

import UIKit
import Firebase

class HomeLoginVC: UIViewController, HomeLoginScreenDelegate {
   
    var auth: Auth?
    var alert: Alert?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        screen?.delegate(delegate: self)
        self.auth = Auth.auth()
        alert = Alert(controller: self)
    }
    
    var screen: HomeLoginScreen?
    override func loadView() {
        screen = HomeLoginScreen()
        view = screen
    }
    
    func tappedEntrarButton() {
        
        let email: String = self.screen?.userLoginTextField.text ?? ""
        let senha: String = self.screen?.passLoginTextField.text ?? ""
        
        self.auth?.signIn(withEmail: email, password: senha, completion: { usuario, error in
            if error != nil{
                //print ("Dados incorretos, tente novamente")
                self.alert?.alert(title: "Atenção", message: "Dados incorretos, tente novamente")
            }else{
                if usuario == nil{
                    //print("Tivemos um problema inesperado")
                    self.alert?.alert(title: "Atenção", message: "Tivemos um problema inesperado")

                }else{
                    print("Login feito com sucesso")
                    let vc = ParabensVC()
                    self.navigationController?.pushViewController(vc, animated: true)
                }
            }
        })
    }
    
    func tappedCadastroButton() {
        let vc = CadastroVC()
        navigationController?.pushViewController(vc, animated: true)
    }
}
