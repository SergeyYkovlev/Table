//
//  LoginViewController.swift
//  Table
//
//  Created by Сергей Яковлев on 26.01.2022.
//

import Foundation
import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate {
    
    var iconClick : Bool!
    var changed: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        showPasswordButton.setImage((UIImage(named: "noshow")), for: .normal)
        
        view.backgroundColor = .white
        firsNameTextField.backgroundColor = .systemGray
        lastNameTextField.backgroundColor = .systemGray
        emailTextField.backgroundColor = .systemGray
        passwordTextField.backgroundColor = .systemGray
        clearLastNameButton.isHidden = true
        clearFirstNameButton.isHidden = true
        clearEmailButton.isHidden = true
        clearPasswordButton.isHidden = true
        
        firsNameTextField.addTarget(self, action: #selector(firstNameTextFieldDidChange), for: .editingChanged)
        lastNameTextField.addTarget(self, action: #selector(lastNameTextFieldDidChange), for: .editingChanged)
        emailTextField.addTarget(self, action: #selector(emailTextFieldDidChange), for: .editingChanged)
        passwordTextField.addTarget(self, action: #selector(passwordTextFieldDidChange), for: .editingChanged)
        iconClick = true
    }
    
    // MARK: - Subviews
    
    @IBOutlet weak var firsNameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var showPasswordButton: UIButton!
    @IBOutlet weak var clearFirstNameButton: UIButton!
    @IBOutlet weak var clearPasswordButton: UIButton!
    @IBOutlet weak var clearEmailButton: UIButton!
    @IBOutlet weak var clearLastNameButton: UIButton!
    @IBOutlet weak var warningEmailLabel: UILabel!
    @IBOutlet weak var warningLastNameLabel: UILabel!
    @IBOutlet weak var warningFirstNameLabel: UILabel!
    @IBOutlet weak var warningPasswordLabel: UILabel!
    
    @objc func firstNameTextFieldDidChange(textField: UITextField) {
        print(textField.text)
        
        clearFirstNameButton.isHidden = false
        firsNameTextField.backgroundColor = .systemGray
        warningFirstNameLabel.text = ""
        if firsNameTextField.text == "" {
            clearFirstNameButton.isHidden = true
            firsNameTextField.backgroundColor = .systemGray
            warningFirstNameLabel.text = ""
        }
    }
    @objc func lastNameTextFieldDidChange(textField: UITextField) {
        clearLastNameButton.isHidden = false
        lastNameTextField.backgroundColor = .systemGray
        warningLastNameLabel.text = ""
        if lastNameTextField.text == "" {
            clearLastNameButton.isHidden = true
            lastNameTextField.backgroundColor = .systemGray
            //resultLastName.text = ""
        }
    }
    
    @objc func emailTextFieldDidChange(textField: UITextField) {
        clearEmailButton.isHidden = false
        emailTextField.backgroundColor = .systemGray
        warningEmailLabel.text = ""
        if emailTextField.text == "" {
            clearEmailButton.isHidden = true
            emailTextField.backgroundColor = .systemGray
            // resultEmail.text = ""
        }
    }
    
    @objc func passwordTextFieldDidChange(textField: UITextField) {
        clearPasswordButton.isHidden = false
        passwordTextField.backgroundColor = .systemGray
        warningPasswordLabel.text = ""
        if passwordTextField.text == "" {
            clearPasswordButton.isHidden = true
            passwordTextField.backgroundColor = .systemGray
            //resultPassword.text = ""
        }
    }
    
    // MARK: - Actions
    
    @IBAction func show(_ sender: Any) {
        if ( iconClick == true) {
            passwordTextField.isSecureTextEntry = false
            showPasswordButton.setImage((UIImage(named: "show")), for: .normal)
            iconClick = false
        } else {
            passwordTextField.isSecureTextEntry = true
            showPasswordButton.setImage((UIImage(named: "noshow")), for: .normal)
            iconClick = true
        }
    }
    
    func firstName() {
        if firsNameTextField.text?.isEmpty ?? true {
            warningFirstNameLabel.text = "это поле не может быть пустым"
            warningFirstNameLabel.textColor = .systemPink
            warningFirstNameLabel.isHidden = false
            firsNameTextField.backgroundColor = UIColor.systemPink
        } else {
            //сделать пустым
            warningFirstNameLabel.isHidden = true
            firsNameTextField.backgroundColor = UIColor.systemGreen
        }
    }
    
    func lastName() {
        if lastNameTextField.text?.isEmpty ?? true {
            warningLastNameLabel.text = "это поле не может быть пустым"
            warningLastNameLabel.textColor = .systemPink
            warningLastNameLabel.isHidden = false
            lastNameTextField.backgroundColor = UIColor.systemPink
        } else {
            warningLastNameLabel.isHidden = true
            lastNameTextField.backgroundColor = UIColor.systemGreen
        }
    }
    
    func email(str: String) {
        if emailTextField.text?.isEmpty ??  true {
            warningEmailLabel.text = "это поле не может быть пустым"
            warningEmailLabel.textColor = .systemPink
            warningEmailLabel.isHidden = false
            emailTextField.backgroundColor = UIColor.systemPink
        } else if !isValidEmail(str: str)  {
            warningEmailLabel.text = "Введите правильный email"
            warningEmailLabel.textColor = .systemPink
            warningEmailLabel.isHidden = false
            emailTextField.backgroundColor = UIColor.systemPink
        } else {
            warningEmailLabel.isHidden = true
            emailTextField.backgroundColor = UIColor.systemGreen
        }
    }
    
    func password() {
        if passwordTextField.text?.isEmpty ?? true  {
            warningPasswordLabel.text = "это поле не может быть пустым"
            warningPasswordLabel.textColor = .systemPink
            warningPasswordLabel.isHidden = false
            passwordTextField.backgroundColor = UIColor.systemPink
        } else if passwordTextField.text!.count < 6 {
            warningPasswordLabel.text = "Пароль не может быть короче 6 символов"
            warningPasswordLabel.textColor = .systemPink
            warningPasswordLabel.isHidden = false
            passwordTextField.backgroundColor = UIColor.systemPink
            
        } else {
            warningPasswordLabel.isHidden = true
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
        firsNameTextField.backgroundColor = .systemGray
        warningFirstNameLabel.text = ""
        clearFirstNameButton.isHidden = true
    }
    
    @IBAction func clearLastName(_ sender: Any) {
        lastNameTextField.text = ""
        lastNameTextField.backgroundColor = .systemGray
        warningLastNameLabel.text = ""
        clearLastNameButton.isHidden = true
    }
    
    @IBAction func clearPassword(_ sender: Any) {
        passwordTextField.text = ""
        passwordTextField.backgroundColor = .systemGray
        warningPasswordLabel.text = ""
        clearPasswordButton.isHidden = true
    }
    
    @IBAction func clearEmail(_ sender: Any) {
        emailTextField.text = ""
        emailTextField.backgroundColor = .systemGray
        warningEmailLabel.text = ""
        clearEmailButton.isHidden = true
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
