//
//  LoginController.swift
//  Twitter
//
//  Created by Yuan on 13/11/2021.
//

import UIKit

class LoginController: UIViewController {
    
    // MARK: - Properties
    private let logoImageView: UIImageView = {
       
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.clipsToBounds = true
        iv.image = #imageLiteral(resourceName: "TwitterLogo")
        return iv
        
    }()
    
    private lazy var emailContainerView: UIView = {
        
        let view = Helper().inputContainerView(withImage: #imageLiteral(resourceName: "ic_mail_outline_white_2x-1"), textField: emailTextFeild)
        
        return view
        
    }()
    
    private lazy var passwordContainerView: UIView = {
        
        let view = Helper().inputContainerView(withImage: #imageLiteral(resourceName: "ic_lock_outline_white_2x"), textField: passwordTextFeild)
        
        return view
        
    }()
    
    private lazy var emailTextFeild: UITextField = {
        
        let tf = Helper().textFeild(withPlaceholder: "Email")
        return tf
        
    }()
    
    private lazy var passwordTextFeild: UITextField = {
        
        let tf = Helper().textFeild(withPlaceholder: "Password")
        tf.isSecureTextEntry = true
        return tf
        
    }()
    
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
        navigationController?.navigationBar.isHidden = true
        navigationController?.navigationBar.barStyle = .black
        
        view.addSubview(logoImageView)
        logoImageView.centerX(inView: view, topAnchor: view.safeAreaLayoutGuide.topAnchor, paddingTop: 0)
        logoImageView.setDimensions(width: 100, height: 100)
        
        let stack = UIStackView(arrangedSubviews: [emailContainerView, passwordContainerView])
        stack.axis = .vertical
        stack.spacing = 8
        
        view.addSubview(stack)
        stack.anchor(top: logoImageView.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingLeft: 32, paddingRight: 32)
        
    }


}
