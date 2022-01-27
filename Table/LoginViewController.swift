//
//  LoginViewController.swift
//  Table
//
//  Created by Сергей Яковлев on 26.01.2022.
//

import Foundation
import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var firsNameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    
    
    
    @IBOutlet weak var showFirstName: UIButton!
    
    @IBOutlet weak var showPassword: UIButton!
    @IBOutlet weak var showEmail: UIButton!
    @IBOutlet weak var showLastName: UIButton!
    @IBOutlet weak var resultEmail: UILabel!
    @IBOutlet weak var resultLastName: UILabel!
    @IBOutlet weak var resultFirstName: UILabel!
    @IBOutlet weak var resultPassword: UILabel!
    
    var iconClick : Bool!
    var changed: Bool = false
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        showLastName.isHidden = true
        showFirstName.isHidden = true
        showEmail.isHidden = true
        showPassword.isHidden = true
        
        firsNameTextField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        lastNameTextField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        emailTextField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        passwordTextField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        iconClick = true
    }
    
//    func touch() {
//        if firsNameTextField.text == "" {
//            showClearfirstName.isHidden = true
//        }else {
//            showClearfirstName.isHidden = false
//        }
//
//    }
    
    
    @objc func textFieldDidChange(textField: UITextField) {
        print(textField.text)
        
        showFirstName.isHidden = false
        if firsNameTextField.text == "" {
            showFirstName.isHidden = true
        }
        showLastName.isHidden = false
        if lastNameTextField.text == "" {
            showLastName.isHidden = true
        }
        showEmail.isHidden = false
        if emailTextField.text == "" {
            showEmail.isHidden = true
        }
        showPassword.isHidden = false
        if passwordTextField.text == "" {
            showPassword.isHidden = true
        }
    }
    
    
    
    @IBAction func show(_ sender: Any) {
        if ( iconClick == true) {
            passwordTextField.isSecureTextEntry = false
            iconClick = false
        } else {
            passwordTextField.isSecureTextEntry = true
            iconClick = true
        }
        
    }
    
    
    
    

    func firstName() {
        if firsNameTextField.text?.isEmpty ?? true {
            resultFirstName.text = "это поле не может быть пустым"
            resultFirstName.textColor = .systemPink
            resultFirstName.isHidden = false
            firsNameTextField.backgroundColor = UIColor.systemPink
        } else {
            //сделать пустым
            resultFirstName.isHidden = true
            firsNameTextField.backgroundColor = UIColor.systemGreen
            
        }
    }
    
    func lastName() {
        if lastNameTextField.text?.isEmpty ?? true {
            resultLastName.text = "это поле не может быть пустым"
            resultLastName.textColor = .systemPink
            resultLastName.isHidden = false
            lastNameTextField.backgroundColor = UIColor.systemPink
        } else {
            resultLastName.isHidden = true
            lastNameTextField.backgroundColor = UIColor.systemGreen
        }
    }
    
    func email(str: String) {
        if emailTextField.text?.isEmpty ??  true {
            resultEmail.text = "это поле не может быть пустым"
            resultEmail.textColor = .systemPink
            resultEmail.isHidden = false
            emailTextField.backgroundColor = UIColor.systemPink
        } else if !isValidEmail(str: str)  {
            resultEmail.text = "Введите правильный email"
            resultEmail.textColor = .systemPink
            resultEmail.isHidden = false
            emailTextField.backgroundColor = UIColor.systemPink
        } else {
            resultEmail.isHidden = true
            emailTextField.backgroundColor = UIColor.systemGreen
        }
    }
    
    func password() {
        if passwordTextField.text?.isEmpty ?? true  {
            resultPassword.text = "это поле не может быть пустым"
            resultPassword.textColor = .systemPink
            resultPassword.isHidden = false
            passwordTextField.backgroundColor = UIColor.systemPink
        } else if passwordTextField.text!.count < 6 {
            resultPassword.text = "Пароль не может быть короче 6 символов"
            resultPassword.textColor = .systemPink
            resultPassword.isHidden = false
            passwordTextField.backgroundColor = UIColor.systemPink
            
        } else {
            resultPassword.isHidden = true
            passwordTextField.backgroundColor = UIColor.systemGreen
        }
    }
    
    
    func isValidEmail(str: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPred = NSPredicate(format: "SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: str)
    }
    
    @IBAction func clearFirstName(_ sender: Any) {
        firsNameTextField.text = ""
        firsNameTextField.backgroundColor = .white
        resultFirstName.text = ""
        showFirstName.isHidden = true
    }
    
    @IBAction func clearLastName(_ sender: Any) {
        lastNameTextField.text = ""
        lastNameTextField.backgroundColor = .white
        resultLastName.text = ""
        showLastName.isHidden = true
        
    }
    
    @IBAction func clearPassword(_ sender: Any) {
        passwordTextField.text = ""
        passwordTextField.backgroundColor = .white
        resultPassword.text = ""
        showPassword.isHidden = true
    }
    
    @IBAction func clearEmail(_ sender: Any) {
        emailTextField.text = ""
        emailTextField.backgroundColor = .white
        resultEmail.text = ""
        showEmail.isHidden = true
    }
    
    @IBAction func send(_ sender: Any) {
        firstName()
        lastName()
        if let text = emailTextField.text {
            email(str: text)
        }
        
        password()
        
        
    }
    
}
