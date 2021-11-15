//
//  UserServices.swift
//  Twitter
//
//  Created by Yuan on 15/11/2021.
//

import UIKit
import Firebase

struct UserServices {
    
    
    static let shared: UserServices = UserServices()
    
    func fetchUser() -> Void {
        
        guard let uid = Auth.auth().currentUser?.uid else { return }
        REF_USERS.child(uid).observeSingleEvent(of: .value) { snaphot in
            
            guard let dictionary = snaphot.value as? [String: AnyObject] else { return }

            
            let user = User(uid: uid, dictionary: dictionary)
            
        }
        
    }
    
    
}
