//
//  ProfileViewController.swift
//  trenddit
//
//  Created by MacBook on 2/5/18.
//  Copyright © 2018 C4Q. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UITableViewDelegate, UITableViewDataSource {
    
var testArr = ["as","abc","awe"]
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = Stylesheet.Colors.White
        profileSegmentedControl.tintColor = Stylesheet.Colors.LightBlue
        setupProfilePicture()
        self.postCollectionView.register(UINib(nibName: "ProfileCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "ProfileCollectionViewCell")
        postCollectionView.backgroundColor = Stylesheet.Colors.White
        self.voteTableView.register(UINib(nibName: "VoteTableViewCell", bundle: nil), forCellReuseIdentifier: "VoteTableViewCell")
        self.postCollectionView.dataSource = self
        self.postCollectionView.delegate = self
        self.voteTableView.dataSource = self
        self.voteTableView.delegate = self
    }
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var postCounter: UILabel!
    @IBOutlet weak var upvoteCounter: UILabel!
    @IBOutlet weak var downvoteCounter: UILabel!
    
    @IBOutlet weak var voteTableView: UITableView!
    @IBOutlet weak var postCollectionView: UICollectionView!
    @IBOutlet weak var profileSegmentedControl: UISegmentedControl!
  
    @IBAction func selectedSegmentedControlIndex(_ sender: UISegmentedControl) {
        if profileSegmentedControl.selectedSegmentIndex == 0 {
            voteTableView.isHidden = true
            postCollectionView.isHidden = false
        } else {
            voteTableView.isHidden = false
            postCollectionView.isHidden = true
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return testArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = voteTableView.dequeueReusableCell(withIdentifier: "VoteTableViewCell", for: indexPath) as! VoteTableViewCell
        return cell
    }
    
    
    let profileCollectionViewCellID = "ProfileCollectionViewCell"
    let profileTableViewCellID = "ProfileTableViewCell"
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = postCollectionView.dequeueReusableCell(withReuseIdentifier: profileCollectionViewCellID, for: indexPath) as! ProfileCollectionViewCell
        return cell
    }
    @IBAction func showPostCollectionView(_ sender: UIButton) {
        postCollectionView.isHidden = false
        voteTableView.isHidden = true
    }
    
    @IBAction func showVoteTableView(_ sender: UIButton) {
        postCollectionView.isHidden = true
        voteTableView.isHidden = false
    }
    

    
    private func setupProfilePicture() {
        profileImage.image = #imageLiteral(resourceName: "feedPlaceHolder")
        profileImage.layer.cornerRadius = 5
        profileImage.clipsToBounds = true
        
    }
    
    private func setUpLabels() {
    
    }
}
