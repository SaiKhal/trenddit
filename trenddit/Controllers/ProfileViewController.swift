//
//  ProfileViewController.swift
//  trenddit
//
//  Created by MacBook on 2/5/18.
//  Copyright © 2018 C4Q. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var postCounter: UILabel!
    @IBOutlet weak var upvoteCounter: UILabel!
    @IBOutlet weak var downvoteCounter: UILabel!
    
    @IBOutlet weak var voteTableView: UITableView!
    @IBOutlet weak var postCollectionView: UICollectionView!
    @IBAction func showPostCollectionView(_ sender: UIButton) {
        postCollectionView.isHidden = false
        voteTableView.isHidden = true
    }
    
    @IBAction func showVoteTableView(_ sender: UIButton) {
        postCollectionView.isHidden = true
        voteTableView.isHidden = false
    }
    

    
    private func setupProfilePicture() {
        profileImage.layer.cornerRadius = profileImage.frame.size.width/2
    }
}
