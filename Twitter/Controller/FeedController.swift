//
//  FeedController.swift
//  Twitter
//
//  Created by Yuan on 13/11/2021.
//

import UIKit

class FeedController: UIViewController {
    
    // MARK: - Properties
    
    // MARK: - Properties
    var user: User? {
        
        didSet {
            
            print("❌ DEBUG: Setted user")
            
        }
        
    }
    
    private lazy var logoImage: UIImageView = {
        
        let imageView = UIImageView(image: #imageLiteral(resourceName: "twitter_logo_blue"))
        imageView.contentMode = .scaleAspectFit
        return imageView
        
    }()
    
    private lazy var avatarImage: UIImageView = {
        
        let iv = UIImageView()
        iv.backgroundColor = .twitterBlue
        iv.setDimensions(width: 32, height: 32)
        iv.layer.cornerRadius = 32/2
        
        return iv
        
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        configUI()
    }
    

    func configUI() -> Void {
        view.backgroundColor = .white
    
        navigationItem.titleView = logoImage
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: avatarImage)
        
    }

}
