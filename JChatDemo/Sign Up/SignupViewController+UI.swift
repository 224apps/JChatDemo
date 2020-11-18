//
//  SignupViewController+UI.swift
//  JChatDemo
//
//  Created by Abdoulaye Diallo on 11/17/20.
//

import UIKit
import ProgressHUD
import Firebase

extension SignupViewController {
    
    func setupTitleLabel(){
        let title = "Sign Up"
        let attributedText = NSMutableAttributedString(string: title,
                                                       attributes: [ NSAttributedString.Key.font : UIFont.init(name: "Didot", size: 28)!,
                                                                     NSAttributedString.Key.foregroundColor: UIColor.black ])
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing =  5
        attributedText.addAttribute(NSAttributedString.Key.paragraphStyle, value: paragraphStyle, range: NSMakeRange(0, attributedText.length))
        titleTextLabel.numberOfLines = 0
        titleTextLabel.attributedText = attributedText
    }
    
    func setupAvatar(){
        avatar.layer.cornerRadius = 40
        avatar.clipsToBounds = true
        avatar.isUserInteractionEnabled  = true
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleAvatarTapGesture))
        avatar.addGestureRecognizer(tapGesture)
    }
    func setupFullNameTextField(){
        fullnameContainerView.layer.borderWidth = 1
        fullnameContainerView.layer.borderColor = UIColor(red: 210/255, green: 210/255, blue: 210/255, alpha: 1).cgColor
        fullnameContainerView.layer.cornerRadius = 3
        fullnameContainerView.clipsToBounds =  true
        fullnameTextField.borderStyle = .none
        
        let placeholderAttr = NSAttributedString(string: "Full Name", attributes: [NSAttributedString.Key.foregroundColor: UIColor(red: 170/255, green: 170/255, blue: 170/255, alpha: 1)])
        fullnameTextField.attributedPlaceholder = placeholderAttr
        fullnameTextField.textColor = UIColor(red: 99/255, green: 99/255, blue: 99/255, alpha: 1)
        
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
        passwordContainerVIew.layer.borderWidth = 1
        passwordContainerVIew.layer.borderColor = UIColor(red: 210/255, green: 210/255, blue: 210/255, alpha: 1).cgColor
        passwordContainerVIew.layer.cornerRadius = 3
        passwordContainerVIew.clipsToBounds =  true
        passwordTextField.borderStyle = .none
        
        let placeholderAttr = NSAttributedString(string: "Password ( 8+ characters)", attributes: [NSAttributedString.Key.foregroundColor: UIColor(red: 170/255, green: 170/255, blue: 170/255, alpha: 1)])
        passwordTextField.attributedPlaceholder = placeholderAttr
        passwordTextField.textColor = UIColor(red: 99/255, green: 99/255, blue: 99/255, alpha: 1)
        passwordTextField.isSecureTextEntry = true
    }
    func setupSignUpButton(){
        signupButton.setTitle("Sign Up", for: .normal)
        signupButton.setTitleColor(.white, for: .normal)
        signupButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        signupButton.backgroundColor = .black
        signupButton.layer.cornerRadius = 5
        signupButton.clipsToBounds = true
    }
    
    func setupSignInButton(){
        let attributedTermsText = NSMutableAttributedString(string: "By clicking to \"Create a new account\" you agree to our " , attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 14), NSAttributedString.Key.foregroundColor : UIColor(white: 0, alpha: 0.65)])
        
        let attributedSignInText = NSMutableAttributedString(string: "Sign In" , attributes: [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 14), NSAttributedString.Key.foregroundColor : UIColor(white: 0, alpha:0.65)])
        
        attributedTermsText.append(attributedSignInText)
        signinButton.setAttributedTitle(attributedTermsText, for: .normal)
        signinButton.titleLabel?.numberOfLines = 0
    }
    
    //MARK: - Helper Methods
    
    @objc func handleAvatarTapGesture(){
        let picker = UIImagePickerController()
        picker.sourceType = .photoLibrary
        picker.allowsEditing = true
        picker.delegate = self
        self.present(picker, animated: true)
    }
    
    
    //MARK: - View Controller touches
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
      func validateFields(){
        guard let username = self.fullnameTextField.text, !username.isEmpty else {
            ProgressHUD.showError("Plese enter a username")
            return
        }
        
        guard let email = self.emailTextField.text, !email.isEmpty else {
            ProgressHUD.showError("Plese enter a email")
            return
        }
        
        guard let password = self.passwordTextField.text, !password.isEmpty else {
            ProgressHUD.showError("Plese enter a password")
            return
        }
    }
    
    
    func signUp(){
        API.User.signUp(withUsername: self.fullnameTextField.text!,
                        email: self.emailTextField.text!, password: self.passwordTextField.text!,
                        image: self.image,
                        onSuccess: {
                            print("Done")
                        },
                        onError: { (errorMessage)  in
                            print(errorMessage)
                        })
    }
}

//MARK: - Extension (UIImagePickerControllerDelegate)

extension SignupViewController: UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let imageEditedSelected = info[.editedImage] as? UIImage {
            avatar.image = imageEditedSelected
            image = imageEditedSelected
        }
        if let imageOriginalSelected = info[.originalImage] as? UIImage {
            avatar.image = imageOriginalSelected
            image = imageOriginalSelected
        }
        picker.dismiss(animated: true, completion: nil)
    }
}

