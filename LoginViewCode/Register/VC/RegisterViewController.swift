//
//  RegisterViewController.swift
//  LoginViewCode
//
//  Created by Jadiê on 08/03/23.
//

import UIKit
import Firebase

class RegisterViewController: UIViewController {
    
    var registerScreen:RegisterScreen?
    var alert: Alert?
    
    var auth:Auth?
    
    override func loadView() {
        self.registerScreen = RegisterScreen()
        self.view = self.registerScreen
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.registerScreen?.configTextFieldDelegate(delegate: self)
        self.registerScreen?.delegate(delegate: self)
        self.auth = Auth.auth()
        self.alert = Alert(controller: self)
    }
}

extension RegisterViewController:RegisterScreenProtocol {
    func actionRegisterButton() {
        
        let email:String = self.registerScreen?.emailTextField.text ?? ""
        let password:String = self.registerScreen?.passwordTextField.text ?? ""

        self.auth?.createUser(withEmail: email, password: password, completion: { (result, error) in
            if error != nil {
                self.alert?.getAlert(title: "Error", msg: "Erro ao cadastrar")
            } else {
                self.alert?.getAlert(title: "Parabéns", msg: "Usuário cadastrado com sucesso!!!", completion: {
                    self.navigationController?.popViewController(animated: true)
                })
            }
        })
    }
    
    
}

extension RegisterViewController:UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        self.registerScreen?.validateTextField()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
    }
}
