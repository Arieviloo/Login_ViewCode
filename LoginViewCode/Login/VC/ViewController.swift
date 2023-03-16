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
    
    override func loadView() {
        self.loginScreen = LoginScreen()
        self.view = self.loginScreen
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.loginScreen?.delegate(delegate: self)
        self.loginScreen?.configTextFieldDelegate(delegate: self)
        self.auth = Auth.auth()
    }
}


extension ViewController:LoginScreenProtocol {
    func actionLoginButton() {
        print("login")
        let email:String = self.loginScreen?.emailTextField.text ?? ""
        let password:String = self.loginScreen?.passwordTextField.text ?? ""
        
        self.auth?.signIn(withEmail: email, password: password, completion: {(user, error) in
            
            if error != nil {
                print("Dados incorretos")
            }else {
                if user == nil {
                    print("Erro inesperado ")
                }else {
                    print("Logado com sucesso!!!")
                }
            }
        } )
        
    }
    
    func actionRegisterButton() {
        print("register button")
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

