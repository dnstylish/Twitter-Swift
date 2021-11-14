//
//  SignUpController.swift
//  Twitter
//
//  Created by Yuan on 13/11/2021.
//

import UIKit

class SignUpController: UIViewController {
    
    // MARK: - Properties
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        configUI()
        
    }
    
    
    // MARK: - Selectors
    
    // MARK: - Helpers
    func configUI() -> Void {
        
        view.backgroundColor = .twitterBlue
        
    }


}

