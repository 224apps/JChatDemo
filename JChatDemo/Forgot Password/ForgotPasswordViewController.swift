//
//  ForgotPasswordViewController.swift
//  JChatDemo
//
//  Created by Abdoulaye Diallo on 11/17/20.
//

import UIKit

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
}
