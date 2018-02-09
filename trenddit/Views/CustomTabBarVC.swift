//
//  CustomTabBarVC.swift
//  trenddit
//
//  Created by Masai Young on 1/30/18.
//  Copyright © 2018 C4Q. All rights reserved.
//

import UIKit
import FirebaseAuth
import Kingfisher

class CustomTabBarVC: UIViewController {
    
    var userProfileImageURL: URL!
    var userProfileImage: UIImage?
    
    
    init(user: User) {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        applyTabBar(into: self)
    }

    func applyTabBar(into controller: UIViewController) {
        let tabIcons: [String] = ["houses", "plus", "user"]

        let tabController = AZTabBarController.insert(into: controller, withTabIconNames: tabIcons, andSelectedIconNames: tabIcons)
        
        let feedViewController = FeedViewController()
        let feednavigationController = UINavigationController(rootViewController: feedViewController)

        // Set controllers inside tab bar
        //Kaniz - I added my view controller as one of the tabs
        tabController.setViewController(PostViewController(), atIndex: 1)
//        tabController.setTitle("Post", atIndex: 1)
        tabController.setViewController(feednavigationController, atIndex: 0)
//        tabController.setTitle("Feed", atIndex: 0)
        tabController.setViewController(LoginVC(), atIndex: 2)
//        tabController.setTitle("User", atIndex: 2)
        
        if let image = userProfileImage {
            
//            tabController.setTabIcon(forIndex: 2, normal: #imageLiteral(resourceName: "feedPlaceHolder")) 
        }

        // Configure tab bar apparance
        tabController.defaultColor = Stylesheet.Contexts.TabBarController.DefaultColor
        tabController.selectedColor = Stylesheet.Contexts.TabBarController.SelectedColor
        tabController.highlightColor = Stylesheet.Contexts.TabBarController.HighlightColor
        tabController.highlightedBackgroundColor = Stylesheet.Contexts.TabBarController.HighlightedBackgroundColor
        tabController.buttonsBackgroundColor = Stylesheet.Contexts.TabBarController.ButtonsBackgroundColor
        tabController.selectionIndicatorColor = Stylesheet.Contexts.TabBarController.SelectionIndicatorColor
        tabController.selectionIndicatorHeight = 3.0
        tabController.separatorLineColor = Stylesheet.Contexts.TabBarController.SeparatorLineColor
        tabController.separatorLineVisible = true
        tabController.animateTabChange = true
    }
}
