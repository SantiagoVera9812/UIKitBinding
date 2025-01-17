//
//  ViewController.swift
//  ViewBindingUIKit
//
//  Created by Christian Santiago Vera Rojas on 31/10/24.
//

import UIKit

class ViewController: UIViewController {
    
    private var loginVM = LoginViewModel()
    
    lazy var usernameTextField: UITextField = {
        
        let usernameTextField = BindingTextField()
        usernameTextField.placeholder = "Enter username"
        usernameTextField.backgroundColor = UIColor.lightGray
        usernameTextField.borderStyle = .roundedRect
        usernameTextField.bind{ [weak self] text in
            self?.loginVM.username.value = text
            
        }
        
        return usernameTextField
        
    }()
    
    lazy var passwordtextField: UITextField = {
        
        let passwordTextField = BindingTextField()
        passwordTextField.isSecureTextEntry = true
        passwordTextField.placeholder = "Enter password"
        passwordTextField.backgroundColor = UIColor.lightGray
        passwordTextField.borderStyle = .roundedRect
        passwordTextField.bind{
            [weak self] text in
            self?.loginVM.password.value = text
        }
        
        return passwordTextField
    }()
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        loginVM.username.bind{ [weak self]
            text in
            self?.usernameTextField.text = text
            
        }
        
        loginVM.password.bind{ [weak self]
            text in
            self?.passwordtextField.text = text
            
        }
        // Do any additional setup after loading the view.
        
        setupUI()
    }
    
    @objc func login(){
        
        print(loginVM.username.value)
        print(loginVM.password.value)
        
    }
    
    @objc func loginInfoButton(){
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            [weak self] in
            self?.loginVM.username.value = "marydoe"
            self?.loginVM.password.value = "password"
        }
        
        
    }
    
    private func setupUI(){
        
        let loginButton = UIButton()
        loginButton.setTitle("Login", for: .normal)
        loginButton.backgroundColor = UIColor.gray
        loginButton.addTarget(self, action: #selector(login), for: .touchUpInside)
        
        let fetchLoginInfoButton = UIButton()
        fetchLoginInfoButton.setTitle("fetch Login Info", for: .normal)
        fetchLoginInfoButton.backgroundColor = UIColor.blue
        fetchLoginInfoButton.addTarget(self, action: #selector(loginInfoButton), for: .touchUpInside)
        
        let stackView = UIStackView(arrangedSubviews: [usernameTextField, passwordtextField, loginButton, fetchLoginInfoButton])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 20
        stackView.distribution = .fillEqually
        
        self.view.addSubview(stackView)
        
        stackView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        stackView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        stackView.widthAnchor.constraint(equalToConstant: 200).isActive = true
        
    }


}

