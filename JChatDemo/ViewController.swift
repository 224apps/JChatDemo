//
//  ViewController.swift
//  JChatDemo
//
//  Created by Abdoulaye Diallo on 11/15/20.
//

import UIKit

class ViewController: UIViewController {
    
    //IBOutlet
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var signInGoogleButton: UIButton!
    @IBOutlet weak var signInFacebook: UIButton!
    @IBOutlet weak var createNewAccountButton: UIButton!
    @IBOutlet weak var termsOfServiceLabel: UILabel!
    @IBOutlet weak var orLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    

    private func setupUI(){
        setupHeaderTitle()
        setupOrLabel()
        setupTermsLabel()
        setupFacebookButton()
        setupGoogleButton()
        setupCreateANewAccount()

    }
        
}

