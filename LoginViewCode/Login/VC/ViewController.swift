//
//  ViewController.swift
//  LoginViewCode
//
//  Created by Jadiê on 06/03/23.
//

import UIKit

class ViewController: UIViewController {
    
    var loginScreen:LoginScreen?
    
    override func loadView() {
        self.loginScreen = LoginScreen()
        self.view = self.loginScreen
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.loginScreen?.delegate(delegate: self)
        self.loginScreen?.configTextFieldDelegate(delegate: self)
    }
}


extension ViewController:LoginScreenProtocol {
    func actionLoginButton() {
        print("login button")
    }
    
    func actionRegisterButton() {
        print("register button")
        
    }
    
}

extension ViewController:UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
    }
}

