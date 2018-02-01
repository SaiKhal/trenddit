//
//  FeedView.swift
//  trenddit
//
//  Created by Clint M on 1/31/18.
//  Copyright © 2018 C4Q. All rights reserved.
//

import UIKit
import SnapKit

class FeedView: UIView {
    
    
    //MARK: - Constants
    let postCellID = "FeedCollectionViewCell"
    let categoryCellID = "CategoryCollectionViewCell"
    
    //MARK: - Outlets
    lazy var feedCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let collectionView = UICollectionView(frame: self.bounds, collectionViewLayout: layout)
        let screenHeight: CGFloat = UIScreen.main.bounds.height
        let screenWidth: CGFloat = UIScreen.main.bounds.width
        let cellSpacing: CGFloat = 15.0
        let numberOfCells: CGFloat = 1
        let numberOfSpaces: CGFloat = numberOfCells + 1
        layout.itemSize = CGSize(width: (screenWidth - (cellSpacing * numberOfSpaces)) / numberOfCells, height: screenHeight * 0.25)
        layout.sectionInset = UIEdgeInsetsMake(cellSpacing, cellSpacing , cellSpacing, cellSpacing )
        layout.minimumLineSpacing = cellSpacing
        layout.minimumInteritemSpacing = cellSpacing
        collectionView.backgroundColor = .white
        collectionView.register(FeedCollectionViewCell.self, forCellWithReuseIdentifier: postCellID)
        return collectionView
    }()
    
    lazy var categoryCollectionView: UICollectionView = {
        let screenHeight: CGFloat = UIScreen.main.bounds.height
        let screenWidth: CGFloat = UIScreen.main.bounds.width
        let cellSpacing: CGFloat = 10
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: screenWidth * 0.35, height: screenHeight * 0.20)
        layout.sectionInset = UIEdgeInsetsMake(cellSpacing, cellSpacing + 5, cellSpacing, cellSpacing + 5)
        layout.minimumLineSpacing = cellSpacing
        layout.minimumInteritemSpacing = cellSpacing
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: self.bounds, collectionViewLayout: layout)
        collectionView.backgroundColor = UIColor(displayP3Red: 238/255, green: 242/255, blue: 245/255, alpha: 0.8 )
        collectionView.register(CategoryCollectionViewCell.self, forCellWithReuseIdentifier: categoryCellID )
        return collectionView
    }()
    
    // MARK: - Initializers
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Functions
    private func setupView(){
        setupFeedCollectionView()
    }
    
    private func addSubviews() {
        addSubview(feedCollectionView)
        addSubview(categoryCollectionView)
    }
    
    private func setupFeedCollectionView() {
        feedCollectionView.snp.makeConstraints { (make) in
            make.top.equalTo(snp.top)
            make.width.equalTo(self)
            make.centerX.equalTo(self)
            make.height.equalTo(self).multipliedBy(0.25)
        }
    }
    
    private func setupCategoryCollectionView() {
        feedCollectionView.snp.makeConstraints { (make) in
            make.top.equalTo(feedCollectionView.snp.bottom)
            make.width.equalTo(self)
            make.centerX.equalTo(self)
            make.height.equalTo(self).multipliedBy(0.75)
        }
    }
}

