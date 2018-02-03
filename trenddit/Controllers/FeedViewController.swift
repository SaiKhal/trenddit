//
//  FeedViewController.swift
//  trenddit
//
//  Created by Clint M on 1/31/18.
//  Copyright © 2018 C4Q. All rights reserved.
//

import UIKit

class FeedViewController: UIViewController {
    
    // TODO: complete camera function and complete configureTabBar function.
    
    // MARK: - Constants
    let feedView = FeedView()
    
    // MARK: - Overrides
    override func viewDidLoad() {
        self.view.backgroundColor = .red
        self.feedView.feedCollectionView.dataSource = self
        self.feedView.feedCollectionView.delegate = self
        self.feedView.categoryCollectionView.dataSource = self
        self.feedView.categoryCollectionView.delegate = self
        addSubView()
        setupView()
        configureTabBar()
        configureNavBar()
    }
    
    // MARK: - Functions
    private func configureNavBar() {
        navigationItem.title = "trenddit"
        navigationController?.navigationBar.prefersLargeTitles = true
        let cameraButton = UIBarButtonItem(image: #imageLiteral(resourceName: "photo-camera"), style: .plain, target: self, action: #selector(cameraButtonClicked))
        navigationItem.rightBarButtonItem = cameraButton
    }
    
    // TODO: complete camera function
    @objc func cameraButtonClicked() {
        print("camera button pressed")
    }
    
    // TODO : input correct tag etc
    private func configureTabBar() {
        self.tabBarItem = UITabBarItem(title: nil, image: #imageLiteral(resourceName: "houses"), tag: 1)
    }
    
    private func addSubView() {
        self.view.addSubview(feedView)
    }
    
    private func setupView() {
        setupFeedView()
    }
    
    private func setupFeedView() {
        feedView.snp.makeConstraints { (constraint) in
            constraint.edges.equalTo(view.safeAreaLayoutGuide.snp.edges)
        }
    }
}

//m// MARK: - CollectionView Data Source
extension FeedViewController: UICollectionViewDataSource  {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard collectionView == self.feedView.categoryCollectionView else { return 10 }
        return 10 // return count for categoryCollectionView
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard collectionView == self.feedView.categoryCollectionView else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: feedView.postCellID, for: indexPath) as! FeedCollectionViewCell
            // TODO: complete init
//            cell.configureFeedCell(with: <#T##String#>, and: <#T##UIImage#>)
            
            return cell
        }
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: feedView.categoryCellID, for: indexPath) as! CategoryCollectionViewCell
        
        // TODO: complete init
//        cell.configureCategoryCell(with: <#T##String#>, and: <#T##UIImage#>)
        
        return cell
    }
}

//MARK: CollectionView Delegate method
extension FeedViewController: UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
}

