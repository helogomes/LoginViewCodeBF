//
//  RegisterVC.swift
//  LoginViewCodeCurso
//
//  Created by user218997 on 04/11/22.
//

import UIKit
import Firebase

class RegisterVC: UIViewController {
    
    var registerScreen: RegisterScreen?
    var auth: Auth?
    var alert: Alert?
    
    override func loadView() {
        registerScreen = RegisterScreen()
        view = registerScreen
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        registerScreen?.configTextFieldDelegate(delegate: self)
        registerScreen?.delegate(delegate: self)
        auth = Auth.auth()
        alert = Alert(controller: self)
    }
    
}

extension RegisterVC: UITextFieldDelegate {
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        registerScreen?.validateTextFields()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

extension RegisterVC: RegisterScreenProtocol {
    
    func actionBackButton() {
        self.navigationController?.popViewController(animated: true)
    }
    
    func actionRegisterButton() {
        
        guard let register = self.registerScreen else { return }
        
        self.auth?.createUser(withEmail: register.getEmail(), password: register.getPassword(), completion: { result, error in
            if error != nil {
                self.alert?.getAlert(title: "Atenção", message: "Erro ao cadastrar, verifique os dados e tente novamente.")
            }else {
                self.alert?.getAlert(title: "Parabéns!", message: "Usuário cadastrado com sucesso!", completion: {
                    self.navigationController?.popViewController(animated: true)
                })
            }
        })
    }
    
}
