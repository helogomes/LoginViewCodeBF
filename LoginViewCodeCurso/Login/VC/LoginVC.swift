//
//  ViewController.swift
//  LoginViewCodeCurso
//
//  Created by user218997 on 04/11/22.
//

import UIKit
import Firebase

class LoginVC: UIViewController {
    
    var loginScreen: LoginScreen?
    var auth: Auth?
    var alert: Alert?
    
    override func loadView() {
        loginScreen = LoginScreen()
        view = loginScreen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //delegate: self -> self é do tipo ViewController, ou seja, ela (a classe ViewController) que está assinando o protocolo e vai conter todas as ações do protocolo
        //o que estou fazendo na linha 23 é a msm coisa de loginScreen.delegate = self
        loginScreen?.delegate(delegate: self)
        loginScreen?.configTextFieldDelegate(delegate: self)
        auth = Auth.auth()
        alert = Alert(controller: self)
    }

    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }

}

extension LoginVC: UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        print("textFieldDidBeginEditing")
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        print("textFieldDidEndEditing")
        loginScreen?.validateTextFields()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print("textFieldShouldReturn")
        textField.resignFirstResponder()
        return true
    }
}

extension LoginVC: LoginScreenProtocol {
    
    func actionLoginButton() {
       
        guard let login = self.loginScreen else { return }

        self.auth?.signIn(withEmail: login.getEmail(), password: login.getPassword(), completion: { user, error in
            if error != nil {
                self.alert?.getAlert(title: "Atenção", message: "Dados incorretos. Verifique e tente novamente!")
            }else {
                if user == nil {
                    self.alert?.getAlert(title: "Atenção", message: "Tivemos um problema inesperado, tente novamente mais tarde.")
                }else {
                    let vc: HomeVC = HomeVC()
                    self.navigationController?.pushViewController(vc, animated: true)
                }
            }
        })
    }
    
    func actionRegisterButton() {
        let vc: RegisterVC = RegisterVC()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
 
    
    
}
