//
//  MainTabController.swift
//  Twitter
//
//  Created by Yuan on 13/11/2021.
//

import UIKit

class MainTabController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        configView()
    }
    
    func configView() -> Void {
        
        let feed = FeedController()
        let nav1 = buildNavigationController(image: #imageLiteral(resourceName: "home_unselected"), rootView: feed)
        
        let explore = ExploreController()
        let nav2 = buildNavigationController(image: #imageLiteral(resourceName: "search_unselected"), rootView: explore)
        
        
        let notfications = NotificationsController()
        let nav3 = buildNavigationController(image: #imageLiteral(resourceName: "like_unselected"), rootView: notfications)
        
        let messages = MessagesController()
        let nav4 = buildNavigationController(image: #imageLiteral(resourceName: "comment"), rootView: messages)
        
        viewControllers = [nav1, nav2, nav3, nav4]
        
    }
    
    func buildNavigationController(image: UIImage, rootView: UIViewController) -> UINavigationController {
        
        let nav = UINavigationController(rootViewController: rootView)
        nav.tabBarItem.image = image
        nav.navigationBar.barTintColor = .white
        return nav
        
    }

}
