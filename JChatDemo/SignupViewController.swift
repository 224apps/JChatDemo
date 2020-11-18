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
    
    var image: UIImage? = nil 
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
        
        guard let imageSelected = self.image else {
            print("Avatar is None")
            return
        }
        guard let imageData = imageSelected.jpegData(compressionQuality: 0.4) else { return }
        
        Auth.auth().createUser(withEmail: "test@gmail.com", password: "test123") { (authDataResult, error) in
            if error != nil {
                print(error!.localizedDescription)
                return
            }
            if let authData = authDataResult {
                var dict:  Dictionary<String, Any> = [
                    "user" : authData.user.uid,
                    "email" : authData.user.email!,
                    "profileImageUrl" : "",
                    "status" : "Welcome to JChat"
                ]
                
                let storageRef = Storage.storage().reference(forURL:"gs://jchatdemo-eecdb.appspot.com")
                let storageProfileRef = storageRef.child("profile").child(authData.user.uid)
                    
                let metadata = StorageMetadata()
                metadata.contentType = "image/jpg"
      
                storageProfileRef.putData(imageData, metadata: metadata, completion: { (storageMetaData, error) in
                    if error != nil {
                        print(error!.localizedDescription)
                        return
                    }
                    
                    storageProfileRef.downloadURL { (url, error) in
                        if let metaImageUrl = url?.absoluteString {
                            dict["profileImageUrl"] = metaImageUrl
                            Database.database().reference().child("users").child(authData.user.uid).updateChildValues(dict) { (error, ref) in
                                if error == nil {
                                    print("Done")
                                }
                            }
                        }
                        
                    }
                    
                })
                
            }
        }
    }
    
}

