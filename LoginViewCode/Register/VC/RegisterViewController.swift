//
//  RegisterViewController.swift
//  LoginViewCode
//
//  Created by Jadiê on 08/03/23.
//

import UIKit

class RegisterViewController: UIViewController {
    
    var registerScreen:RegisterScreen?
    
    override func loadView() {
        self.registerScreen = RegisterScreen()
        self.view = self.registerScreen
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.registerScreen?.configTextFieldDelegate(delegate: self)
        self.registerScreen?.delegate(delegate: self)
    }
}

extension RegisterViewController:RegisterScreenProtocol {
    func actionRegisterButton() {
        print("cadastrado")
    }
    
    
}

extension RegisterViewController:UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
    }
}
