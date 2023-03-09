//
//  RegisterScreen.swift
//  LoginViewCode
//
//  Created by Jadiê on 09/03/23.
//

import UIKit

protocol RegisterScreenProtocol:class {
    func actionRegisterButton()
}

class RegisterScreen: UIView {
    
    private weak var delegate:RegisterScreenProtocol?
    
    func delegate(delegate:RegisterScreenProtocol) {
        self.delegate = delegate
    }
    
    lazy var userImageView:UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.image = UIImage(named: "user")
        img.contentMode = .scaleAspectFit
        return img
    }()
    
    lazy var emailTextField:UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.autocorrectionType = .no
        tf.backgroundColor = .white
        tf.borderStyle = .roundedRect
        tf.keyboardType = .emailAddress
        tf.placeholder = "Digite seu Email:"
        tf.font = UIFont.systemFont(ofSize: 14)
        tf.textColor = .darkGray
        return tf
    }()
    
    lazy var passwordTextField:UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.autocorrectionType = .no
        tf.backgroundColor = .white
        tf.borderStyle = .roundedRect
        tf.keyboardType = .default
        tf.placeholder = "Digite sua senha:"
        tf.isSecureTextEntry = true
        tf.font = UIFont.systemFont(ofSize: 14)
        tf.textColor = .darkGray
        return tf
    }()
    
    lazy var registerButton:UIButton = {
       let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("Cadastrar", for: .normal)
        btn.setTitleColor(.white, for: .normal)
        btn.clipsToBounds = true
        btn.layer.cornerRadius = 7.5
        btn.backgroundColor = UIColor(red: 3/255, green: 58/255, blue: 51/255, alpha: 1.0)
        btn.addTarget(self, action: #selector(self.tappedRegisterButton), for: .touchUpInside)
        return btn
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.configScreenBackground()
        self.configSuperView()
        self.setUpConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func configScreenBackground() {
        self.backgroundColor = UIColor(red: 24/255, green: 117/255, blue: 104/255, alpha: 1.0)
    }
    
    private func configSuperView() {
        self.addSubview(self.userImageView)
        self.addSubview(self.emailTextField)
        self.addSubview(self.passwordTextField)
        self.addSubview(self.registerButton)
    }
    
    public func configTextFieldDelegate(delegate:UITextFieldDelegate){
        self.emailTextField.delegate = delegate
        self.passwordTextField.delegate = delegate
    }
    
    @objc private func tappedRegisterButton() {
        self.delegate?.actionRegisterButton()
    }
    
    private func setUpConstraints() {
        NSLayoutConstraint.activate([
            self.userImageView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 20),
            self.userImageView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.userImageView.widthAnchor.constraint(equalToConstant: 150),
            self.userImageView.heightAnchor.constraint(equalToConstant: 150),
            
            self.emailTextField.topAnchor.constraint(equalTo: self.userImageView.bottomAnchor, constant: 40),
            self.emailTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            self.emailTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            self.emailTextField.heightAnchor.constraint(equalToConstant: 45),
            
            self.passwordTextField.topAnchor.constraint(equalTo: self.emailTextField.bottomAnchor, constant: 15),
            self.passwordTextField.leadingAnchor.constraint(equalTo: self.emailTextField.leadingAnchor),
            self.passwordTextField.trailingAnchor.constraint(equalTo: self.emailTextField.trailingAnchor),
            self.passwordTextField.heightAnchor.constraint(equalTo: self.emailTextField.heightAnchor),
            
            self.registerButton.topAnchor.constraint(equalTo: self.passwordTextField.bottomAnchor, constant: 20),
            self.registerButton.leadingAnchor.constraint(equalTo: self.emailTextField.leadingAnchor),
            self.registerButton.trailingAnchor.constraint(equalTo: self.emailTextField.trailingAnchor),
            self.registerButton.heightAnchor.constraint(equalTo: self.emailTextField.heightAnchor),
            
        ])
    }
    

}
