//
//  Constants.swift
//  Twitter
//
//  Created by Yuan on 14/11/2021.
//

import Firebase

let DB_REF = Database.database().reference()

let REF_USERS = DB_REF.child("users")


let STORAGE_REF = Storage.storage().reference()
let STORAGE_PROFILE_IMAGES = STORAGE_REF.child("profile_images")
