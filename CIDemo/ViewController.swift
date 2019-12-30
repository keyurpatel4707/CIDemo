//
//  ViewController.swift
//  CIDemo
//
//  Created by Keyur Patel on 28/12/19.
//  Copyright © 2019 3Embed. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // MARK:- IBOutlets -
    @IBOutlet weak var loginLabel: UILabel!
    @IBOutlet weak var enterEmailLabel: UILabel!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var enterPasswordLabel: UILabel!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "CIDemo"
        addTapGestureRecognizer()
        // Do any additional setup after loading the view.
    }

    @IBAction func loginButtonAction(_ sender: Any? = nil) {
        print("Login button press")
        view.endEditing(true)
    }
}

extension ViewController : UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
                 case emailTextField         : verifyEmail()
                 case passwordTextField      : verifyPassword()
                 default                     : break
        }
        return true
    }
     func textFieldDidEndEditing(_ textField: UITextField, reason: UITextField.DidEndEditingReason) {
           switch textField {
           case emailTextField         : verifyEmail()
           case passwordTextField      : verifyPassword()
           default                     : break
           }
       }
}

extension ViewController {
    func verifyEmail() {
        if let email = emailTextField.text {
            if email.isValidEmail() {
                passwordTextField.becomeFirstResponder()
            } else if email.count > 0 {
                displayAlert("Alert", with: "Please enter valid E-mail ID")
            }
        }
    }
    
    func verifyPassword() {
        if let password = passwordTextField.text {
            if password.isValidPassword() {
                loginButtonAction()
            } else if password.count > 0 {
                displayAlert("Alert", with: getErrorMessageFor(password))
            }
        }
    }
    
    func getErrorMessageFor(_ password: String?) -> String? {
        let message = "Password requires at least "
        var messageArray = [String]()
        if let txt = password {
            if (txt.rangeOfCharacter(from: CharacterSet.uppercaseLetters) == nil) {
                messageArray.append("one upper case letter")
            }
            if (txt.rangeOfCharacter(from: CharacterSet.lowercaseLetters) == nil) {
                messageArray.append("one lower case letter")
            }
            if (txt.rangeOfCharacter(from: CharacterSet.decimalDigits) == nil) {
                messageArray.append("one number")
            }
            if txt.range(of: ".*[^A-Za-z0-9].*", options: .regularExpression) == nil {
                messageArray.append("one specail character")
            }
            if txt.count < 7 {
                messageArray.append("seven characters")
            }
        }
        if messageArray.count == 1 {
            return message + (messageArray.first ?? "")
        } else if messageArray.count > 1 {
            return message + Array(messageArray[0...messageArray.count - 2]).joined(separator: ", ") + " and " + (messageArray.last ?? "")
        } else {
            return message
        }
    }
    
    func displayAlert(_ title: String? = nil, with message: String? = nil) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default)
        alert.addAction(okButton)
        self.present(alert, animated: true, completion: nil)
    }
}

extension ViewController: UIGestureRecognizerDelegate {
    func addTapGestureRecognizer() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        tap.delegate = self
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
