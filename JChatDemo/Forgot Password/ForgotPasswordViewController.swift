//
//  ForgotPasswordViewController.swift
//  JChatDemo
//
//  Created by Abdoulaye Diallo on 11/17/20.
//

import UIKit
import ProgressHUD

class ForgotPasswordViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var emailContainerView: UIView!
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var resetPasswordButton: UIButton!
    
    override func viewDidLoad() {
        setupUI()
    }
    
    fileprivate func setupUI(){
        setupTitleLabel()
        setupEmailTextField()
        setupResetPasswordButton()
    }
    @IBAction func closeForgotPasswordViewController(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    
    }
    @IBAction func resetPasswordDidTapped(_ sender: UIButton) {
        guard let email  = emailTextField.text , !email.isEmpty else {
            ProgressHUD.showError(ERROR_EMPTY_EMAIL_RESET)
            return
        }
        API.User.resetPassword(WithEmail: email) {
            self.view.endEditing(true)
            ProgressHUD.showSuccess(SUCCESS_EMAIL_RESET)
        } onError: { (errorMessage) in
            ProgressHUD.showError(errorMessage)
        }
    }
}
