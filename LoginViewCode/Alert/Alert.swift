//
//  Alert.swift
//  LoginViewCode
//
//  Created by Jadiê on 17/03/23.
//

import Foundation
import UIKit

class Alert:NSObject {
    var controller: UIViewController
    
    init(controller: UIViewController) {
        self.controller = controller
    }
    
    func getAlert(title: String, msg: String, completion: (() -> Void)? = nil) {
        let alertController = UIAlertController(title: title, message: msg, preferredStyle: .alert)
        let cancel = UIAlertAction(title: "OK", style: .cancel) { action in
            completion?()
        }
        
        alertController.addAction(cancel)
        self.controller.present(alertController, animated: true, completion: nil)
    }
}
