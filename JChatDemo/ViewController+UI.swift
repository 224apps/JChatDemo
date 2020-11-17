//
//  ViewController+UI.swift
//  JChatDemo
//
//  Created by Abdoulaye Diallo on 11/16/20.
//

import UIKit

extension ViewController {
    func setupHeaderTitle() {
        let title = "Create a new account"
        let subTitle = "\n\nLorem ipsum dolor sit amet, consectetur adipiscing elit, sed do"
        let attributedText = NSMutableAttributedString(string: title,
                                                       attributes: [ NSAttributedString.Key.font : UIFont.init(name: "Didot", size: 28)!,
                                                                     NSAttributedString.Key.foregroundColor: UIColor.black ])
        let attributedSubTitle = NSMutableAttributedString(string: subTitle,
                                                           attributes: [ NSAttributedString.Key.font : UIFont.systemFont(ofSize: 16),
                                                                         NSAttributedString.Key.foregroundColor: UIColor(white: 0, alpha: 0.45) ])
        attributedText.append(attributedSubTitle)
        
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing =  5
        attributedText.addAttribute(NSAttributedString.Key.paragraphStyle, value: paragraphStyle, range: NSMakeRange(0, attributedText.length))
        titleLabel.numberOfLines = 0
        titleLabel.attributedText = attributedText
        
    }
    
    func setupOrLabel(){
        orLabel.text = "Or"
        orLabel.font  = UIFont.boldSystemFont(ofSize: 16)
        orLabel.textColor  = UIColor(white: 0, alpha: 0.45)
        orLabel.textAlignment  = .center
    }
    func setupTermsLabel(){
        let attributedTermsText = NSMutableAttributedString(string: "By clicking to \"Create a new account\" you agree to our " , attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 14), NSAttributedString.Key.foregroundColor : UIColor(white: 0, alpha: 0.65)])
        
        let attributedSubTermsText = NSMutableAttributedString(string: "Terms of Service." , attributes: [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 14), NSAttributedString.Key.foregroundColor : UIColor(white: 0, alpha:0.65)])
        
        attributedTermsText.append(attributedSubTermsText)
        termsOfServiceLabel.attributedText = attributedTermsText
        termsOfServiceLabel.numberOfLines = 0
    }
    
    func  setupFacebookButton(){
        signInFacebook.setTitle("  Sign In with Facebook", for: UIControl.State.normal)
        signInFacebook.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        signInFacebook.backgroundColor =  UIColor(red: 58/255, green: 85/255, blue: 159/255, alpha: 1 )
        signInFacebook.layer.cornerRadius = 5
        signInFacebook.clipsToBounds = true
        signInFacebook.setImage(UIImage(named: "icon-facebook"), for: .normal)
        signInFacebook.imageView?.contentMode = .scaleAspectFit
        signInFacebook.tintColor = .white
        signInFacebook.largeContentImageInsets = UIEdgeInsets(top: 12, left: -18, bottom: 12, right: 0)
        
    }
    func setupGoogleButton(){
        signInGoogleButton.setTitle("  Sign In with Google", for: UIControl.State.normal)
        signInGoogleButton.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        signInGoogleButton.backgroundColor =  UIColor(red: 223/255, green: 74/255, blue: 50/255, alpha: 1 )
        signInGoogleButton.layer.cornerRadius = 5
        signInGoogleButton.clipsToBounds = true
        signInGoogleButton.setImage(UIImage(named: "icon-google"), for: .normal)
        signInGoogleButton.imageView?.contentMode = .scaleAspectFit
        signInGoogleButton.tintColor = .white
        signInGoogleButton.largeContentImageInsets = UIEdgeInsets(top: 12, left: -18, bottom: 12, right: 0)
    }
    func setupCreateANewAccount(){
        createNewAccountButton.setTitle("Create a new Account", for: .normal)
        createNewAccountButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        createNewAccountButton.backgroundColor = .black
        createNewAccountButton.layer.cornerRadius = 5
        createNewAccountButton.clipsToBounds = true
    }
}
