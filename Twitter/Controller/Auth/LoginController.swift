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
    
    private lazy var emailTextFeild: UITextField = {
        
        return Helper().textFeild(withPlaceholder: "Email")
        
    }()
    
    private lazy var emailContainerView: UIView = {
        
        let view = Helper().inputContainerView(withImage: #imageLiteral(resourceName: "ic_mail_outline_white_2x-1"), textField: emailTextFeild)
        
        return view
        
    }()
    
    private lazy var passwordContainerView: UIView = {
        
        let view = Helper().inputContainerView(withImage: #imageLiteral(resourceName: "ic_lock_outline_white_2x"), textField: passwordTextField)
        
        return view
        
    }()
    
    private lazy var passwordTextField: UITextField = {
        
        let tf = Helper().textFeild(withPlaceholder: "Password")
        tf.isSecureTextEntry = true
        return tf
        
    }()
    
    private lazy var loginButton: UIButton = {
       
        let bt = UIButton(type: .system)
        bt.setTitle("Login", for: .normal)
        bt.setTitleColor(.twitterBlue, for: .normal)
        bt.backgroundColor = .white
        bt.layer.cornerRadius = 8
        bt.heightAnchor.constraint(lessThanOrEqualToConstant: 50).isActive = true
        bt.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        bt.addTarget(self, action: #selector(handleLogin), for: .touchUpInside)
        return bt
        
    }()
    
    private lazy var dontHaveAccountButton: UIButton = {
       
        let bt = Helper().textButton("Don't have account? ", "Sign In")
        bt.addTarget(self, action: #selector(handleSignUp), for: .touchUpInside)
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
        
        guard let email = emailTextFeild.text else { return }
        guard let password = passwordTextField.text else { return }
        
        AuthService.shared.logUserIn(withEmail: email, password: password) { result, error in
            
            if let error = error {
                
                print("❌ DEBUG: Lỗi đăng nhập")
                print("❌ DEBUG: \(error.localizedDescription)")
                return
                
            }
            
            print("❌ DEBUG: Đăng nhập thành công")
            
            guard let window = UIApplication.shared.windows.first(where: { $0.isKeyWindow }) else { return }
            guard let tab = window.rootViewController as? MainTabController else { return }
            
            tab.authUserAndConfig()
            
            self.dismiss(animated: true, completion: nil)
            
            
            
        }
        
    }
    
    @objc func handleSignUp() -> Void {
        
        let controller = SignUpController()
        navigationController?.pushViewController(controller, animated: true)
        
    }
    
    // MARK: - Helpers
    func configUI() -> Void {
        
        view.backgroundColor = .twitterBlue
        navigationController?.navigationBar.isHidden = true
        navigationController?.navigationBar.barStyle = .black
        
        view.addSubview(logoImageView)
        logoImageView.centerX(inView: view, topAnchor: view.safeAreaLayoutGuide.topAnchor, paddingTop: 0)
        logoImageView.setDimensions(width: 100, height: 100)
        
        let stack = UIStackView(arrangedSubviews: [emailContainerView, passwordContainerView, loginButton])
        stack.axis = .vertical
        stack.spacing = 20
        stack.distribution = .fillEqually
        
        view.addSubview(stack)
        stack.anchor(top: logoImageView.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingLeft: 32, paddingRight: 32)
        
        view.addSubview(dontHaveAccountButton)
        dontHaveAccountButton.anchor(left: view.leftAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, right: view.rightAnchor, paddingLeft: 16, paddingBottom: 16, paddingRight: 16)
        
        
    }


}
