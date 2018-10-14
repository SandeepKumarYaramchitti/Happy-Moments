//
//  LoginController.swift
//  Happy Moments
//
//  Created by Sandeep Kumar  Yaramchitti on 10/8/18.
//  Copyright © 2018 Sandeep Kumar  Yaramchitti. All rights reserved.
//

import UIKit
import Firebase

class LoginController: UIViewController {
    
    let logoViewController: UIView = {
        let view = UIView()
        let logoImageVIew = UIImageView(image: #imageLiteral(resourceName: "HappyMoments").withRenderingMode(.alwaysOriginal))
        logoImageVIew.backgroundColor = .white
        logoImageVIew.contentMode = .scaleAspectFill
        view.addSubview(logoImageVIew)
        _ = logoImageVIew.anchor(nil, left: nil, bottom: nil, right: nil, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 180, heightConstant: 180)
        logoImageVIew.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        logoImageVIew.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        return view
    }()
    
    //Email UI Text Field
    let emailTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Email"
        textField.borderStyle = .roundedRect
        textField.backgroundColor = UIColor(white: 0, alpha: 0.03)
        textField.addTarget(self, action: #selector(handleTextInputChange), for: .editingChanged)
        return textField
    }()
    
    //Password Text Field
    let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.isSecureTextEntry = true
        textField.placeholder = "Password"
        textField.borderStyle = .roundedRect
        textField.backgroundColor = UIColor(white: 0, alpha: 0.03)
        textField.addTarget(self, action: #selector(handleTextInputChange), for: .editingChanged)
        return textField
    }()
    
    //Controls the change state here
    @objc func handleTextInputChange(){
        let isFormValid = emailTextField.text?.characters.count ?? 0 > 0 &&  passwordTextField.text?.characters.count ?? 0 > 0
        
        if isFormValid {
            logInButton.isEnabled = true
            logInButton.backgroundColor = UIColor.rgb(red: 17, green: 154, blue: 237, alpha: 1)
        }else{
            logInButton.isEnabled = false
            logInButton.backgroundColor = UIColor.rgb(red: 149, green: 204, blue: 244, alpha: 1)
        }
    }
    
    //Sign up Button
    let logInButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Log In", for: .normal)
        button.backgroundColor = UIColor.rgb(red: 180, green: 208, blue: 232, alpha: 1)
        button.layer.cornerRadius = 5
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.setTitleColor(.white, for: .normal)
        button.isEnabled = false
        button.addTarget(self, action: #selector(handleLogin), for: .touchUpInside)
        return button
    }()
    
    @objc func handleLogin() {
        guard let email = emailTextField.text else {return}
        guard let password = passwordTextField.text else {return}
        
        Auth.auth().signIn(withEmail: email, password: password) { (user, err) in
            if let err = err {
                print("Error in Signing into the ", err)
                return
            }
            
            print("Logged in With the user:")
            //Reset the UI to show the main tab bar controller
//            guard let mainTabBarController = UIApplication.shared.keyWindow?.rootViewController as? MainTabBarController else {return}
//            mainTabBarController.setUpViewControllers()
           self.dismiss(animated: true, completion: nil)
        }
    }
    
    
    let donotHaveAccountButton: UIButton = {
        
        let button = UIButton(type: .system)
        let attributeTitle = NSMutableAttributedString(string: "Don't have an account? ", attributes: [NSAttributedStringKey.font: UIFont.systemFont(ofSize: 16),NSAttributedStringKey.foregroundColor: UIColor.lightGray])
        attributeTitle.append(NSAttributedString(string: "Sign Up", attributes: [NSAttributedStringKey.font: UIFont.boldSystemFont(ofSize: 16),NSAttributedStringKey.foregroundColor: Colors.logoBlueColor]))
        button.setAttributedTitle(attributeTitle, for: .normal)
        button.addTarget(self, action: #selector(handleShowSignUp), for: .touchUpInside)
        return button
    }()
    
    @objc func handleShowSignUp(){
        let signUpController = SignupController()
        navigationController?.pushViewController(signUpController, animated: true)
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        view.addSubview(logoViewController)
        _ = logoViewController.anchor(view.topAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, topConstant: 50, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 200)
        navigationController?.isNavigationBarHidden = true
        view.backgroundColor = .white
        view.addSubview(donotHaveAccountButton)
        _ = donotHaveAccountButton.anchor(nil, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 50)
        setUpInputFields()
        
    }
    
    fileprivate func setUpInputFields(){
        
        let stackView = UIStackView(arrangedSubviews: [emailTextField,passwordTextField,logInButton])
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.distribution = .fillEqually
        view.addSubview(stackView)
        _ = stackView.anchor(logoViewController.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, topConstant: 30, leftConstant: 40, bottomConstant: 0, rightConstant: 40, widthConstant: 0, heightConstant: 140)
        
    }
}
