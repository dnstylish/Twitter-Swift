//
//  ExploreController.swift
//  Twitter
//
//  Created by Yuan on 13/11/2021.
//

import UIKit

class ExploreController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        configUI()
    }
    

    func configUI() -> Void {
        view.backgroundColor = .white
        
        let imageView = UIImageView(image: #imageLiteral(resourceName: "twitter_logo_blue"))
        imageView.contentMode = .scaleAspectFit
        navigationItem.titleView = imageView
        
    }

}
