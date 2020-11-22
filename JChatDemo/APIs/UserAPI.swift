//
//  UserAPI.swift
//  JChatDemo
//
//  Created by Abdoulaye Diallo on 11/18/20.
//

import UIKit
import ProgressHUD
import Firebase

class UserAPI {
    
    func signIn(withEmail email: String, password: String,onSuccess: @escaping ()-> Void, onError: @escaping (_ errorMessage: String)->Void){
        Auth.auth().signIn(withEmail: email, password: password) { (authData, error) in
            if error != nil {
                onError(error!.localizedDescription)
                return
            }
            onSuccess()
        }
    }
    func signUp(withUsername username: String, email: String, password: String, image: UIImage?,
                onSuccess: @escaping ()-> Void, onError: @escaping (_ errorMessage: String)->Void ){
        
        Auth.auth().createUser(withEmail: email, password: password) { (authDataResult, error) in
            if error != nil {
                print(error!.localizedDescription)
                return
            }
            if let authData = authDataResult {
                let dict:  Dictionary<String, Any> = [
                    UUID : authData.user.uid,
                    EMAIL : authData.user.email!,
                    USERNAME : username,
                    PROFILE_IMAGE_URL: "",
                    STATUS : "Welcome to JChat"
                ]
                
                guard let imageSelected = image else {
                    ProgressHUD.showError(ERROR_EMPTY_PHOTO)
                    return
                }
                guard let imageData = imageSelected.jpegData(compressionQuality: 0.4) else { return }
                
                let storageProfile = Ref().storageSpecificProfile(uid: authData.user.uid)
    
                let metadata = StorageMetadata()
                metadata.contentType = "image/jpg"
                
                
                StorageService.savePhoto(username: username, uuid: authData.user.uid,
                                         data: imageData, metadata: metadata,
                                         storageProfileRef: storageProfile,
                                         dict: dict, onSuccess: {
                                            onSuccess()
                                         }, onError: { (errorMessage) in
                                            onError(errorMessage)
                                         })
            }
        }
    }
    
    func resetPassword(WithEmail email: String, onSuccess: @escaping ()-> Void, onError: @escaping (_ errorMessage: String)->Void){
        Auth.auth().sendPasswordReset(withEmail: email) { (error) in
            if error != nil {
                onError(error!.localizedDescription)
            }
            onSuccess()
            print("Done")
        }
    }
    
    func logOut(){
        do {
            try Auth.auth().signOut()
        } catch  {
            ProgressHUD.showError(error.localizedDescription)
            return 
        }
        (UIApplication.shared.delegate as! AppDelegate).configureInitialVC()
    }
}
