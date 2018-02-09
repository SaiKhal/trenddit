//
//  ProfileVC.swift
//  trenddit
//
//  Created by Masai Young on 2/4/18.
//  Copyright © 2018 C4Q. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class ProfileVC: UIViewController {
    
    let profileView = ProfileView()
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.view.backgroundColor = .white
        view.addSubview(profileView)
        profileView.feedCollectionView.delegate = self
        profileView.feedCollectionView.dataSource = self
        guard let user = AuthClient.currentUser else { return }
        profileView.profileImageView.kf.setImage(with: URL(string: user.photoURL?.absoluteString ?? "")!)
        navigationItem.title = user.displayName
        profileView.segmentedControl.selectedSegmentIndex = 0
        profileView.segmentedControl.addTarget(self, action: #selector(segmentedTapped), for: .touchUpInside)
    }
    
    @objc func segmentedTapped(sender: UISegmentedControl) {
        profileView.feedCollectionView.reloadData()
    }
}

extension ProfileVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch profileView.segmentedControl.selectedSegmentIndex {
        case 0:
            return 4
        case 1:
            return 2
        default:
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FeedCollectionViewCell", for: indexPath)
        cell.backgroundColor = .green
        return cell
    }
    
    
}

extension ProfileVC: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
}

