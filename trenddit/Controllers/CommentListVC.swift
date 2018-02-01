//
//  CommentListVC.swift
//  trenddit
//
//  Created by Ashlee Krammer on 2/1/18.
//  Copyright © 2018 C4Q. All rights reserved.
//

import UIKit

class CommentListVC: UIViewController {
    //Purpose: (Controls Comment View)
    
    var commentListView = CommentListView()
    //View Did Load
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(commentListView)
    }

}
