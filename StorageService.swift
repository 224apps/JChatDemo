//
//  StorageService.swift
//  JChatDemo
//
//  Created by Abdoulaye Diallo on 11/18/20.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseDatabase
import FirebaseStorage
import ProgressHUD

class StorageService {
    
    static  func savePhoto(username: String, uuid: String, data: Data, metadata: StorageMetadata,
                   storageProfileRef: StorageReference, dict: Dictionary<String, Any>,
                   onSuccess: @escaping ()-> Void
                   ,onError: @escaping (_ errorMessage: String)->Void
    ){
        storageProfileRef.putData(data, metadata: metadata, completion: { (storageMetaData, error) in
            
            if error != nil {
                onError(error!.localizedDescription)
                return
            }
            
            storageProfileRef.downloadURL { (url, error) in
                
                if let metaImageUrl = url?.absoluteString {
                    if let changeRequest = Auth.auth().currentUser?.createProfileChangeRequest(){
                        changeRequest.photoURL = url
                        changeRequest.displayName = username
                        changeRequest.commitChanges(completion: {(error) in
                            if let error =  error {
                                ProgressHUD.showError(error.localizedDescription)
                            }
                        })
                    }
                    var dictTemp = dict
                    dictTemp[PROFILE_IMAGE_URL] = metaImageUrl
                    Ref().databaseSpecificUser(uid: uuid).updateChildValues(dictTemp) { (error, ref) in
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

