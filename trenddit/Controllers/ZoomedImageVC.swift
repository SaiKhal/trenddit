//
//  ZoomedImageVC.swift
//  trenddit
//
//  Created by Ashlee Krammer on 2/1/18.
//  Copyright © 2018 C4Q. All rights reserved.
//

import UIKit

class ZoomedImageVC: UIViewController {
    //Purpose: (Controls Zoomed Image View)
    
    //Variables
    var zoomedImageView = ZoomedImageView()
    
    //View Did Load
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(zoomedImageView)
        view.backgroundColor = .black
    }
    
}
