//
//  User.swift
//  Twitter
//
//  Created by Yuan on 15/11/2021.
//

struct User {
    
    let fullname: String
    let name: String
    let email: String
    let profileImageUrl: String
    let uid: String
    
    init(uid: String, dictionary: [String: AnyObject]) {
        
        self.uid = uid
        self.name = dictionary["name"] as? String ?? ""
        self.email = dictionary["email"] as? String ?? ""
        self.profileImageUrl = dictionary["profileImageUrl"] as? String ?? ""
        self.fullname = dictionary["fullname"] as? String ?? ""
        
    }
}
