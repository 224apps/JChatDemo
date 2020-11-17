//
//  SignupViewController.swift
//  JChatDemo
//
//  Created by Abdoulaye Diallo on 11/16/20.
//

import UIKit
import Firebase


class SignupViewController: UIViewController {
    
    @IBOutlet weak var titleTextLabel: UILabel!
    @IBOutlet weak var avatar: UIImageView!
     
    @IBOutlet weak var fullnameContainerView: UIView!
    @IBOutlet weak var fullnameTextField: UITextField!
    
    @IBOutlet weak var emailContainerView: UIView!
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordContainerVIew: UIView!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var signupButton: UIButton!
    @IBOutlet weak var signinButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    func setupUI(){
        setupTitleLabel()
        setupAvatar()
        setupFullNameTextField()
        setupEmailTextField()
        setupPasswordTextField()
        setupSignUpButton()
        setupSignInButton()
    }
    
    //MARK: - IBActions
    
    @IBAction func closeButton(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }

    @IBAction func signUpButtonDidTapped(_ sender: Any) {
        Auth.auth().createUser(withEmail: "test3@gmail.com", password: "test123") { (authDataResult, error) in
            if error != nil {
                print(error!.localizedDescription)
                return
            }
            if let authData = authDataResult {
                print(authData.user.email!)
                let dict: [String: Any] = [
                    "user" : authData.user.uid,
                    "email" : authData.user.email!,
                    "profileImageUrl" : "",
                    "status" : "Welcome to JChat"
                ]
                
                Database.database().reference().child("users").child(authData.user.uid).updateChildValues(dict) { (err, ref) in
                    if err == nil {
                        print("Done")
                    }
                    
                }
            }
        }
    }
    
}
