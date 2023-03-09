//
//  RegisterScreen.swift
//  LoginViewCode
//
//  Created by Jadiê on 09/03/23.
//

import UIKit

class RegisterScreen: UIView {
    
    lazy var userImageView:UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.image = UIImage(named: "user")
        img.contentMode = .scaleAspectFit
        return img
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(self.userImageView)
        self.configScreenBackground()
        self.setUpConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configScreenBackground() {
        self.backgroundColor = UIColor(red: 24/255, green: 117/255, blue: 104/255, alpha: 1.0)
    }
    
    private func setUpConstraints() {
        NSLayoutConstraint.activate([
            self.userImageView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 20),
            self.userImageView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.userImageView.widthAnchor.constraint(equalToConstant: 150),
            self.userImageView.heightAnchor.constraint(equalToConstant: 150)
            
        ])
    }
    

}
