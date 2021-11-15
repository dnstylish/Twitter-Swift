//
//  AuthServices.swift
//  Twitter
//
//  Created by Yuan on 14/11/2021.
//

import UIKit
import Firebase

struct AuthService {
    
    static let shared: AuthService = AuthService()
    
    func logUserIn(withEmail email: String, password: String, completion: @escaping(AuthDataResult?, Error?)->Void) -> Void {
        
        Auth.auth().signIn(withEmail: email, password: password, completion: completion)
        
    }
    
    func registerUser(withCredentials credentials: AuthCredentials, completion: @escaping(Error?, DatabaseReference)-> Void) -> Void {
        
        Auth.auth().createUser(withEmail: credentials.email, password: credentials.password) { result, error in
            
            if let error = error {
                
                print("DEBUG: \(error.localizedDescription)")
                return
                
            }
            
            print("❌ DEBUG: Thành công")
            
            guard let imageData = credentials.profileImage.jpegData(compressionQuality: 0.3) else { return }
            let filename = NSUUID().uuidString
            
            let storageRef: StorageReference = STORAGE_PROFILE_IMAGES.child(filename)
            
            storageRef.putData(imageData, metadata: nil) { meta, error in
                                                
                storageRef.downloadURL { url, error in
                                        
                    guard let profileImageUrl = url?.absoluteString else { return }
                    
                    guard let uid = result?.user.uid else { return }
                    
                    let values: [String: String] = ["email": credentials.email, "username": credentials.username, "fullname": credentials.fullname, "profileImageUrl": profileImageUrl]
                    
                    REF_USERS.child(uid).updateChildValues(values, withCompletionBlock: completion)
                    
                }
                
            }
            
            
            
        }
        
    }
    
}

struct AuthCredentials {
    
    let email: String
    let password: String
    let fullname: String
    let username: String
    let profileImage: UIImage
    
}
