//
//  SignInViewController+UI.swift
//  JChatDemo
//
//  Created by Abdoulaye Diallo on 11/17/20.
//

import UIKit

extension SignInViewController {
    func setupTitleLabel(){
        let title = "Sign In"
        let attributedText = NSMutableAttributedString(string: title,
                                                       attributes: [ NSAttributedString.Key.font : UIFont.init(name: "Didot", size: 28)!,
                                                                     NSAttributedString.Key.foregroundColor: UIColor.black ])
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing =  5
        attributedText.addAttribute(NSAttributedString.Key.paragraphStyle, value: paragraphStyle, range: NSMakeRange(0, attributedText.length))
        titleLabel.numberOfLines = 0
        titleLabel.attributedText = attributedText
    }
    func setupEmailTextField(){
        emailContainerView.layer.borderWidth = 1
        emailContainerView.layer.borderColor = UIColor(red: 210/255, green: 210/255, blue: 210/255, alpha: 1).cgColor
        emailContainerView.layer.cornerRadius = 3
        emailContainerView.clipsToBounds =  true
        emailTextField.borderStyle = .none
        
        let placeholderAttr = NSAttributedString(string: "Email Address", attributes: [NSAttributedString.Key.foregroundColor: UIColor(red: 170/255, green: 170/255, blue: 170/255, alpha: 1)])
        emailTextField.attributedPlaceholder = placeholderAttr
        emailTextField.textColor = UIColor(red: 99/255, green: 99/255, blue: 99/255, alpha: 1)
    }
    func setupPasswordTextField(){
        passwordContainerView.layer.borderWidth = 1
        passwordContainerView.layer.borderColor = UIColor(red: 210/255, green: 210/255, blue: 210/255, alpha: 1).cgColor
        passwordContainerView.layer.cornerRadius = 3
        passwordContainerView.clipsToBounds =  true
        passwordTextField.borderStyle = .none
        
        let placeholderAttr = NSAttributedString(string: "Password ( 8+ characters)", attributes: [NSAttributedString.Key.foregroundColor: UIColor(red: 170/255, green: 170/255, blue: 170/255, alpha: 1)])
        passwordTextField.attributedPlaceholder = placeholderAttr
        passwordTextField.textColor = UIColor(red: 99/255, green: 99/255, blue: 99/255, alpha: 1)
        passwordTextField.isSecureTextEntry = true
    }
    func setupSignInButton(){
        signInButton.setTitle("Sign In", for: .normal)
        signInButton.setTitleColor(.white, for: .normal)
        signInButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        signInButton.backgroundColor = .black
        signInButton.layer.cornerRadius = 5
        signInButton.clipsToBounds = true
    }
    func setupSignUpButton(){
        let attributedTermsText = NSMutableAttributedString(string: "Don't have an account?  " , attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 16), NSAttributedString.Key.foregroundColor : UIColor(white: 0, alpha: 0.65)])
        
        let attributedSignInText = NSMutableAttributedString(string: "Sign Up" , attributes: [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 14), NSAttributedString.Key.foregroundColor : UIColor(white: 0, alpha:0.65)])
        
        attributedTermsText.append(attributedSignInText)
        signupButton.setAttributedTitle(attributedTermsText, for: .normal)
    }
}
