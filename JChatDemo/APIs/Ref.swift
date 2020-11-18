//
//  Ref.swift
//  JChatDemo
//
//  Created by Abdoulaye Diallo on 11/18/20.
//

import Foundation
import Firebase


let REF_USER = "users"
let URL_STORAGE_ROOT = "gs://jchatdemo-eecdb.appspot.com"
let STORAGE_PROFILE = "profile"
let UUID = "uuid"
let EMAIL = "email"
let USERNAME = "username"
let STATUS = "status"
let PROFILE_IMAGE_URL = "profileImageUrl"

let ERROR_EMPTY_PHOTO = "Please choose your profile image"
let ERROR_EMPTY_EMAIL = "Please choose your email address"
let ERROR_EMPTY_USERNAME = "Please enter an username"
let ERROR_EMPTY_PASSWORD = "Please enter a passowrd"

class Ref {
    
    // Database
    let databaseRoot: DatabaseReference = Database.database().reference()
    var databaseUsers: DatabaseReference{
        return databaseRoot.child(REF_USER)
    }
    func databaseSpecificUser(uid: String) -> DatabaseReference{
        return databaseUsers.child(uid)
    }
    
    //Storage
    let storageRoot =  Storage.storage().reference(forURL:URL_STORAGE_ROOT)
    var storageProfile: StorageReference {
        return storageRoot.child(STORAGE_PROFILE)
    }
    func storageSpecificProfile(uid: String) -> StorageReference{
        return storageProfile.child(uid)
    }
}
