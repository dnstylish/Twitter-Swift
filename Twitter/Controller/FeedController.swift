//
//  FeedController.swift
//  Twitter
//
//  Created by Yuan on 13/11/2021.
//

import UIKit

class FeedController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        configUI()
    }
    

    func configUI() -> Void {
        view.backgroundColor = .white
        
        let imageView = UIImageView(image: #imageLiteral(resourceName: "twitter_logo_blue"))
        imageView.contentMode = .scaleAspectFit
        navigationItem.titleView = imageView
        
    }

}
