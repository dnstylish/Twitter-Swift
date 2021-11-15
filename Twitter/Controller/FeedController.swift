//
//  FeedController.swift
//  Twitter
//
//  Created by Yuan on 13/11/2021.
//

import UIKit
import SDWebImage

class FeedController: UIViewController {
    
    // MARK: - Properties
    
    // MARK: - Properties
    var user: User? {
        
        didSet {
            
            print("❌ DEBUG: Setted user")
            configLeftButton()
            
        }
        
    }
    
    private lazy var logoImage: UIImageView = {
        
        let imageView = UIImageView(image: #imageLiteral(resourceName: "twitter_logo_blue"))
        imageView.contentMode = .scaleAspectFit
        return imageView
        
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        configUI()
    }
    

    func configUI() -> Void {
        view.backgroundColor = .white
    
        navigationItem.titleView = logoImage
        
    }
    
    func configLeftButton() -> Void {
        
        let iv = UIImageView()
        iv.backgroundColor = .twitterBlue
        iv.setDimensions(width: 32, height: 32)
        iv.layer.cornerRadius = 32/2
        
        guard let avatar = URL(string: user!.profileImageUrl) else { return }
        
        iv.sd_setImage(with: avatar, completed: nil)
        iv.clipsToBounds = true
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: iv)
        
    }

}
