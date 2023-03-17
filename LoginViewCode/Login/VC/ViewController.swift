//
//  ViewController.swift
//  LoginViewCode
//
//  Created by Jadiê on 06/03/23.
//

import UIKit
import Firebase

class ViewController: UIViewController {
    
    var loginScreen:LoginScreen?
    var auth:Auth?
    var alert:Alert?
    
    override func loadView() {
        self.loginScreen = LoginScreen()
        self.view = self.loginScreen
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.loginScreen?.delegate(delegate: self)
        self.loginScreen?.configTextFieldDelegate(delegate: self)
        self.auth = Auth.auth()
        self.alert = Alert(controller: self)
    }
}


extension ViewController:LoginScreenProtocol {
    func actionLoginButton() {
        let email:String = self.loginScreen?.emailTextField.text ?? ""
        let password:String = self.loginScreen?.passwordTextField.text ?? ""
        
        self.auth?.signIn(withEmail: email, password: password, completion: {(user, error) in
            
            if error != nil {
                self.alert?.getAlert(title: "Atenção ", msg: "Dados incorretos")
            }else {
                if user == nil {
                    self.alert?.getAlert(title: "Atenção ", msg: "Erro inesperado ")
                }else {
                    self.alert?.getAlert(title: "Parabéns", msg: "Logado com sucesso")
                }
            }
        } )
        
    }
    
    func actionRegisterButton() {
        let registerVC = RegisterViewController()
        self.navigationController?.pushViewController(registerVC, animated: true)
    }
    
}

extension ViewController:UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        self.loginScreen?.validateTextField()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
    }
}

