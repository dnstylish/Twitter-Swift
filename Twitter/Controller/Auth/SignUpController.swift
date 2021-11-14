//
//  SignUpController.swift
//  Twitter
//
//  Created by Yuan on 13/11/2021.
//

import UIKit
import Firebase

class SignUpController: UIViewController {
    
    // MARK: - Properties
    
    private let imagePicker = UIImagePickerController()
    private var profileImage: UIImage?
    
    private let plusPhotoView: UIButton = {
       
        let bt = UIButton(type: .system)
        bt.setImage(#imageLiteral(resourceName: "plus_photo"), for: .normal)
        bt.tintColor = .white
        bt.addTarget(self, action: #selector(handleAddPhoto), for: .touchUpInside)
        return bt
        
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
    
    private lazy var fullNameContainerView: UIView = {
        
        let view = Helper().inputContainerView(withImage: #imageLiteral(resourceName: "ic_person_outline_white_2x"), textField: fullNameTextField)
        
        return view
        
    }()
    
    private lazy var fullNameTextField: UITextField = {
       
        return Helper().textFeild(withPlaceholder: "Full Name")
        
    }()
    
    private lazy var usernameContainerView: UIView = {
            
        let view = Helper().inputContainerView(withImage: #imageLiteral(resourceName: "ic_person_outline_white_2x"), textField: userNameTextField)
        
        return view
        
    }()
    
    private lazy var userNameTextField: UITextField = {
        
        return Helper().textFeild(withPlaceholder: "UserName")
        
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
        
        guard let profileImage = profileImage else {
            print("❌ DEBUG: Please select a image")
            return
        }
        
        guard let email = emailTextFeild.text else { return }
        guard let password = passwordTextField.text else { return }
        guard let fullName = fullNameTextField.text else { return }
        guard let userName = userNameTextField.text else { return }
        
        
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            
            if let error = error {
                
                print("DEBUG: \(error.localizedDescription)")
                return
                
            }
            
            print("❌ DEBUG: Thành công")
            
            guard let uid = result?.user.uid else { return }
            
            let values: [String: String] = ["email": email, "userName": userName, "fullName": fullName]
            
            Database.database().reference().child("users").child(uid).updateChildValues(values) { error, ref in
                
                print("❌ DEBUG: Update thông tin thành công")
                
            }
            
            
        }
        
    }
    
    @objc func handleAddPhoto() -> Void  {
        
        present(imagePicker, animated: true) {
            
        }
        
    }
    
    // MARK: - Helpers
    func configUI() -> Void {
        
        view.backgroundColor = .twitterBlue
        navigationController?.navigationBar.isHidden = true
        navigationController?.navigationBar.barStyle = .black
        
        imagePicker.delegate = self
        imagePicker.allowsEditing = true
        
        view.addSubview(plusPhotoView)
        plusPhotoView.centerX(inView: view, topAnchor: view.safeAreaLayoutGuide.topAnchor, paddingTop: 0)
        plusPhotoView.setDimensions(width: 120, height: 120)
        
        let stack = UIStackView(arrangedSubviews: [emailContainerView, passwordContainerView, fullNameContainerView, usernameContainerView, signUpButton])
        stack.axis = .vertical
        stack.spacing = 20
        stack.distribution = .fillEqually
        
        view.addSubview(stack)
        stack.anchor(top: plusPhotoView.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingLeft: 32, paddingRight: 32)
        plusPhotoView.setDimensions(width: 120, height: 120)
        
        view.addSubview(alreadyAccountButton)
        alreadyAccountButton.anchor(left: view.leftAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, right: view.rightAnchor, paddingLeft: 16, paddingBottom: 16, paddingRight: 16)
        
    }


}

extension SignUpController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        guard let profileImage = info[.editedImage] as? UIImage else { return }
        
        self.profileImage = profileImage
        
        plusPhotoView.layer.cornerRadius = 120 / 2
        plusPhotoView.layer.masksToBounds = true
        plusPhotoView.imageView?.contentMode = .scaleAspectFill
        plusPhotoView.imageView?.clipsToBounds = true
        plusPhotoView.layer.borderColor = UIColor.white.cgColor
        plusPhotoView.layer.borderWidth = 1
        
        self.plusPhotoView.setImage(profileImage.withRenderingMode(.alwaysOriginal), for: .normal)
        
        
        dismiss(animated: true, completion: nil)
        
    }
    
}

