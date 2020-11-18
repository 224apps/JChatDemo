//
//  UserAPI.swift
//  JChatDemo
//
//  Created by Abdoulaye Diallo on 11/18/20.
//

import Foundation
import Firebase
import UIKit
import ProgressHUD

class UserAPI {
    func signUp(withUsername username: String, email: String, password: String, image: UIImage?,
                onSuccess: @escaping ()-> Void
                , onError: @escaping (_ errorMessage: String)->Void ){
        
        Auth.auth().createUser(withEmail: email, password: password) { (authDataResult, error) in
            if error != nil {
                print(error!.localizedDescription)
                return
            }
            if let authData = authDataResult {
                var dict:  Dictionary<String, Any> = [
                    "user" : authData.user.uid,
                    "email" : authData.user.email!,
                    "username": username,
                    "profileImageUrl" : "",
                    "status" : "Welcome to JChat"
                ]
                
                guard let imageSelected = image else {
                    ProgressHUD.showError("Avatar is None")
                    return
                }
                guard let imageData = imageSelected.jpegData(compressionQuality: 0.4) else { return }
                
                
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
                                    onSuccess()
                                }else{
                                    onError(error!.localizedDescription)
                                }
                            }
                        }
                    }
                    
                })
                
            }
        }
    }
}
