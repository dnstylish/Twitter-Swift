//
//  MainTabController.swift
//  Twitter
//
//  Created by Yuan on 13/11/2021.
//

import UIKit

class MainTabController: UITabBarController {
    
    let actionButton: UIButton = {
        let button = UIButton(type: .system)
        button.tintColor = .white
        button.backgroundColor = .twitterBlue
        button.setImage(#imageLiteral(resourceName: "new_tweet"), for: .normal)
        
        button.addTarget(self, action: #selector(actionButtonTapped), for: .touchUpInside)
        
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        configView()
        
        configUI()
    }
    
    @objc func actionButtonTapped() {
        
    }
    
    func configUI() -> Void {
        view.addSubview(actionButton)
        actionButton.anchor(bottom: view.safeAreaLayoutGuide.bottomAnchor, right: view.rightAnchor, paddingBottom: 64, paddingRight: 16, width: 56, height: 56)
        
        actionButton.layer.cornerRadius = 56 / 2
    }
    
    func configView() -> Void {
        
        let feed = FeedController()
        let nav1 = buildNavigationController(image: #imageLiteral(resourceName: "home_unselected"), rootView: feed)
        
        let explore = ExploreController()
        let nav2 = buildNavigationController(image: #imageLiteral(resourceName: "search_unselected"), rootView: explore)
        
        
        let notfications = NotificationsController()
        let nav3 = buildNavigationController(image: #imageLiteral(resourceName: "like_unselected"), rootView: notfications)
        
        let messages = MessagesController()
        let nav4 = buildNavigationController(image: #imageLiteral(resourceName: "mail"), rootView: messages)
        
        viewControllers = [nav1, nav2, nav3, nav4]
        
    }
    
    func buildNavigationController(image: UIImage, rootView: UIViewController) -> UINavigationController {
        
        let nav = UINavigationController(rootViewController: rootView)
        nav.tabBarItem.image = image
        nav.navigationBar.barTintColor = .white
        return nav
        
    }

}
