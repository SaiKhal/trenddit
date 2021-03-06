//
//  FeedViewController.swift
//  trenddit
//
//  Created by Clint M on 1/31/18.
//  Copyright © 2018 C4Q. All rights reserved.
//

import UIKit
import SnapKit
import FirebaseDatabase
import Kingfisher

class FeedViewController: UIViewController {

    // MARK: - Constants
    let feedView = FeedView()
    var posts = [Post]() {
        didSet {
            dump(posts)
            feedView.feedCollectionView.reloadData()
        }
    }
    
    
    // MARK: - Overrides
    override func viewDidLoad() {
        self.view.backgroundColor = Stylesheet.Colors.UltraLightGray
        self.feedView.feedCollectionView.dataSource = self
        self.feedView.feedCollectionView.delegate = self
        self.feedView.categoryCollectionView.dataSource = self
        self.feedView.categoryCollectionView.delegate = self
        addSubView()
        setupView()
        configureNavBar()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        getPost()
    }
    
    func getPost() {
        guard let userId = AuthClient.currentUser?.uid else { return }
        DBService.manager.getPosts().observe(.value) { (snapshot) in
            var posts = [Post]()
            for child in snapshot.children.reversed() {
                let dataSnapshot = child as! DataSnapshot
                if let dict = dataSnapshot.value as? [String : Any] {
                    let post = Post.init(postDict: dict)
                    posts.append(post)
                    self.posts = posts
                }
            }
        }
        
    }
    
    // MARK: - Functions
    private func configureNavBar() {
        navigationItem.title = "trenddit"
        navigationController?.navigationBar.prefersLargeTitles = false
        navigationController?.navigationBar.barTintColor = Stylesheet.Colors.White
        let cameraButton = UIBarButtonItem(image: #imageLiteral(resourceName: "photo-camera"), style: .plain, target: self, action: #selector(cameraButtonClicked))
        navigationItem.rightBarButtonItem = cameraButton
    }
    
    // TODO: complete camera function
    @objc func cameraButtonClicked() {
        let grandParent = parent?.parent
        if grandParent is AZTabBarController {
            let tabController = grandParent as! AZTabBarController
            tabController.setIndex(1)
        }
    }
    
    private func addSubView() {
        self.view.addSubview(feedView)
    }
    
    private func setupView() {
        setupFeedView()
    }
    
    private func setupFeedView() {
        feedView.snp.makeConstraints { (make) in
            make.edges.equalTo(view.safeAreaLayoutGuide.snp.edges)
        }
    }
    
    private func setupFeedCellFunctions() {
        
    }
}

// MARK: - CollectionView Data Source
extension FeedViewController: UICollectionViewDataSource  {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard collectionView == self.feedView.categoryCollectionView else {  return posts.count }
        
        return 10 // return count for categoryCollectionView
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard collectionView == self.feedView.categoryCollectionView else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: feedView.postCellID, for: indexPath) as! FeedCollectionViewCell
            let post = posts[indexPath.item]
            cell.delegate = self
            cell.post = post
            cell.configureFeedCell(with: post)
//            cell.delegate = self
//            cell.post = post
            return cell
        }
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: feedView.categoryCellID, for: indexPath) as! CategoryCollectionViewCell
//        cell.configureCategoryCell(with: post)
        return cell
    }
}

//MARK: CollectionView Delegate method
extension FeedViewController: UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
}


extension FeedViewController: FeedCellDelegate {
    func upVotePressed(post: Post) {
        DBService.manager.incrementTotalVotes(post: post)
    }
    
    func downVotePressed(post: Post) {
        DBService.manager.decrementTotalVotes(post: post)
    }
    
    func userNamePressed() {
        
    }
    
    func categoryPressed() {
        
    }
    
    func titlePressed() {
        let commentListViewController = CommentListVC()
        navigationController?.pushViewController(commentListViewController, animated: true)
    }
    
    func profileImagePressed() {
        let profileViewController = ProfileVC()
        navigationController?.pushViewController(profileViewController, animated: true)
    }
    
    func postImagePressed() {
        print("image pressed")
        let zoomedImageVC = ZoomedImageVC()
        navigationController?.pushViewController(zoomedImageVC, animated: true)
    }
    
    func commentPressed(post: Post) {
        present(CommentListVC(post: post), animated: true, completion: nil)
//        let commentListViewController = CommentListVC(post: post)
//        navigationController?.pushViewController(commentListViewController, animated: true)
    }
    
    func optionsPressed() {
    }
    
    func shareButtonPressed() {
        
    }
    
    func flagUser() {
        
    }
    
    func flagPost() {
        
    }
    
    
}

//extension FeedViewController: Router {
//    func route(destination: UIViewController?) {
//        if let destination = destination {
//            present(destination, animated: true, completion: nil)
//        }
//    }
//}

//extension FeedViewController: UICollectionViewDelegateFlowLayout {
//    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        
//        guard collectionView == self.feedView.categoryCollectionView else {
//            //CGSize for feedCollectionView
//            let sized = CGSize(width: collectionView.frame.size.width , height: collectionView.frame.size.height / 1.85)
//            return sized
//        }
//        //CGSize for categoryCollectionView
//        let sized = CGSize(width: collectionView.frame.size.width / 5, height: collectionView.frame.size.height )
//        return sized
//    }
//}

