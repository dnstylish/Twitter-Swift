//
//  SignUpController.swift
//  Twitter
//
//  Created by Yuan on 13/11/2021.
//

import UIKit

class SignUpController: UIViewController {
    
    // MARK: - Properties
    
    private let plusPhotoView: UIButton = {
       
        let bt = UIButton(type: .system)
        bt.setImage(#imageLiteral(resourceName: "plus_photo"), for: .normal)
        bt.tintColor = .white
        bt.addTarget(self, action: #selector(handleAddPhoto), for: .touchUpInside)
        return bt
        
    }()
    
    private lazy var emailContainerView: UIView = {
        
        let tf = Helper().textFeild(withPlaceholder: "Email")
        
        let view = Helper().inputContainerView(withImage: #imageLiteral(resourceName: "ic_mail_outline_white_2x-1"), textField: tf)
        
        return view
        
    }()
    
    private lazy var passwordContainerView: UIView = {
        
        let tf = Helper().textFeild(withPlaceholder: "Password")
        tf.isSecureTextEntry = true
        
        let view = Helper().inputContainerView(withImage: #imageLiteral(resourceName: "ic_lock_outline_white_2x"), textField: tf)
        
        return view
        
    }()
    
    private lazy var fullNameContainerView: UIView = {
        
        let tf = Helper().textFeild(withPlaceholder: "Email")
        
        let view = Helper().inputContainerView(withImage: #imageLiteral(resourceName: "ic_person_outline_white_2x"), textField: tf)
        
        return view
        
    }()
    
    private lazy var usernameContainerView: UIView = {
        
        let tf = Helper().textFeild(withPlaceholder: "Email")
        
        let view = Helper().inputContainerView(withImage: #imageLiteral(resourceName: "ic_person_outline_white_2x"), textField: tf)
        
        return view
        
    }()
    
    private lazy var signUpButton: UIButton = {
       
        let bt = UIButton(type: .system)
        bt.setTitle("Sign Up", for: .normal)
        bt.setTitleColor(.twitterBlue, for: .normal)
        bt.backgroundColor = .white
        bt.layer.cornerRadius = 8
        bt.heightAnchor.constraint(lessThanOrEqualToConstant: 50).isActive = true
        bt.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        bt.addTarget(self, action: #selector(handleSignUp), for: .touchUpInside)
        return bt
        
    }()
    
    
    private lazy var alreadyAccountButton: UIButton = {
       
        let bt = Helper().textButton("Aleady have account? ", "Sign In")
        bt.addTarget(self, action: #selector(handleLogin), for: .touchUpInside)
        return bt
        
    }()
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        configUI()
        
    }
    
    
    // MARK: - Selectors
    @objc func handleLogin() -> Void {
        
        navigationController?.popViewController(animated: true)
        
    }
    
    @objc func handleSignUp() -> Void  {
        
    }
    
    @objc func handleAddPhoto() -> Void  {
        
    }
    
    // MARK: - Helpers
    func configUI() -> Void {
        
        view.backgroundColor = .twitterBlue
        navigationController?.navigationBar.isHidden = true
        navigationController?.navigationBar.barStyle = .black
        
        view.addSubview(plusPhotoView)
        plusPhotoView.centerX(inView: view, topAnchor: view.safeAreaLayoutGuide.topAnchor, paddingTop: 0)
        plusPhotoView.setDimensions(width: 100, height: 100)
        
        let stack = UIStackView(arrangedSubviews: [emailContainerView, passwordContainerView, fullNameContainerView, usernameContainerView, signUpButton])
        stack.axis = .vertical
        stack.spacing = 20
        stack.distribution = .fillEqually
        
        view.addSubview(stack)
        stack.anchor(top: plusPhotoView.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingLeft: 32, paddingRight: 32)
        
        view.addSubview(alreadyAccountButton)
        alreadyAccountButton.anchor(left: view.leftAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, right: view.rightAnchor, paddingLeft: 16, paddingBottom: 16, paddingRight: 16)
        
    }


}

