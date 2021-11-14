//
//  Hepler.swift
//  Twitter
//
//  Created by Yuan on 13/11/2021.
//

import UIKit

class Helper {
    
    func inputContainerView(withImage image: UIImage, textField: UITextField) -> UIView {
        
        let view = UIView()
        view.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        let iv = UIImageView()
        iv.image = image
        
        view.addSubview(iv)
        iv.anchor(left: view.leftAnchor, bottom: view.bottomAnchor, paddingLeft: 8, paddingBottom: 8)
        iv.setDimensions(width: 24, height: 24)
        
        view.addSubview(textField)
        textField.anchor(left: iv.rightAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingLeft: 8, paddingBottom: 8)
        
        let div = UIView()
        div.backgroundColor = .white
        view.addSubview(div)
        div.anchor(left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, height: 0.75)
        
        
        return view
        
    }
    
    func textFeild(withPlaceholder placeholder: String) -> UITextField {
        
        let tf = UITextField()
        tf.textColor = .white
        tf.tintColor = .white
        tf.font = UIFont.systemFont(ofSize: 16)
        tf.attributedPlaceholder = NSAttributedString(string: placeholder, attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        return tf
        
    }
    
    func textButton(_ firstPart: String, _ secondPart: String) -> UIButton {
        
        let bt = UIButton(type: .system)
        
        let attrTitle = NSMutableAttributedString(string: firstPart, attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16), NSAttributedString.Key.foregroundColor: UIColor.white])
        
        attrTitle.append(NSAttributedString(string: secondPart, attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 16), NSAttributedString.Key.foregroundColor: UIColor.white]))
        
        bt.setAttributedTitle(attrTitle, for: .normal)
        
        return bt
        
    }
    
}
