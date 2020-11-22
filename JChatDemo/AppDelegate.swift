//
//  AppDelegate.swift
//  JChatDemo
//
//  Created by Abdoulaye Diallo on 11/15/20.
//

import UIKit
import Firebase

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        FirebaseApp.configure()
        
        configureInitialVC()
        return true
    }
    
    func configureInitialVC() {
        var initialVC : UIViewController
        
        let storyBoard = UIStoryboard(name: "Welcome", bundle: nil)
        if Auth.auth().currentUser == nil {
            initialVC = storyBoard.instantiateViewController(identifier: IDENTIFIER_WELCOME_VC)
        }else{
            initialVC = storyBoard.instantiateViewController(identifier: IDENTIFIER_TABBAR_VC)
        }
        self.window?.rootViewController = initialVC
        self.window?.makeKeyAndVisible()
    }
    
    // MARK: UISceneSession Lifecycle
}

