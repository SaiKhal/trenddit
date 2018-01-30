//
//  CustomTabBarVC.swift
//  trenddit
//
//  Created by Masai Young on 1/30/18.
//  Copyright © 2018 C4Q. All rights reserved.
//

import UIKit

class CustomTabBarVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        applyTabBar(into: self)
    }

    func applyTabBar(into controller: UIViewController) {
        let tabIcons: [String] = ["houses", "plus", "user"]

        let tabController = AZTabBarController.insert(into: controller, withTabIconNames: tabIcons, andSelectedIconNames: tabIcons)

        // Set controllers inside tab bar
        tabController.setViewController(UIViewController(), atIndex: 0)
        tabController.setTitle("Feed", atIndex: 0)
        tabController.setViewController(UIViewController(), atIndex: 1)
        tabController.setTitle("Post", atIndex: 1)
        tabController.setViewController(LoginVC(), atIndex: 2)
        tabController.setTitle("User", atIndex: 2)

        // Configure tab bar apparance
        tabController.defaultColor = Constants.Colors.accent
        tabController.selectedColor = Constants.Colors.accent
        tabController.highlightColor = .white
        tabController.highlightedBackgroundColor = Constants.Colors.accent
        tabController.buttonsBackgroundColor = Constants.Colors.darkPrimary
        tabController.selectionIndicatorColor = Constants.Colors.lightPrimary
        tabController.selectionIndicatorHeight = 3.0
        tabController.separatorLineColor = Constants.Colors.accent
        tabController.separatorLineVisible = true
        tabController.animateTabChange = true
    }
}
