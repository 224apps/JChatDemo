//
//  ForgotViewController+UI.swift
//  JChatDemo
//
//  Created by Abdoulaye Diallo on 11/17/20.
//

import UIKit


extension ForgotPasswordViewController {
    
    func setupTitleLabel(){
        let title = "Forgot Password"
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
    func setupResetPasswordButton(){
        resetPasswordButton.setTitle("RESET MY PASSWORD", for: .normal)
        resetPasswordButton.setTitleColor(.white, for: .normal)
        resetPasswordButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        resetPasswordButton.backgroundColor = .black
        resetPasswordButton.layer.cornerRadius = 5
        resetPasswordButton.clipsToBounds = true
    }
    
}
