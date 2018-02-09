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
        let cellSpacing: CGFloat = 10.0
        let numberOfCells: CGFloat = 1
        let numberOfSpaces: CGFloat = numberOfCells + 1
        layout.itemSize = CGSize(width: (screenWidth - (cellSpacing * numberOfSpaces)) / numberOfCells, height: screenHeight * 0.4)
        layout.sectionInset = UIEdgeInsetsMake(cellSpacing, cellSpacing , cellSpacing, cellSpacing )
        layout.minimumLineSpacing = cellSpacing
        layout.minimumInteritemSpacing = cellSpacing
        collectionView.backgroundColor = Stylesheet.Colors.UltraLightGray
        collectionView.register(FeedCollectionViewCell.self, forCellWithReuseIdentifier: postCellID)
        return collectionView
    }()
    
    lazy var categoryCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: self.bounds, collectionViewLayout: layout)
        let screenHeight: CGFloat = UIScreen.main.bounds.height
//        let screenHeight: CGFloat = collectionView.frame.height
        let screenWidth: CGFloat = UIScreen.main.bounds.width
        let cellSpacing = UIScreen.main.bounds.width * 0.02
        let numberOfCells: CGFloat = 4
        let numberOfSpaces: CGFloat = numberOfCells + 1
        layout.itemSize = CGSize(width: (screenWidth - (cellSpacing * numberOfSpaces)) / (numberOfCells + 0.5), height: screenHeight * 0.11) //0.075
//        layout.sectionInset = UIEdgeInsetsMake(<#T##top: CGFloat##CGFloat#>, <#T##left: CGFloat##CGFloat#>, <#T##bottom: CGFloat##CGFloat#>, <#T##right: CGFloat##CGFloat#>)
//        layout.sectionInset = UIEdgeInsetsMake(0, cellSpacing, cellSpacing, 0)
//        layout.minimumLineSpacing = cellSpacing
//        layout.minimumInteritemSpacing = cellSpacing
        collectionView.backgroundColor = Stylesheet.Colors.White
        collectionView.layer.borderColor = Stylesheet.Colors.LightGray.cgColor
        collectionView.layer.borderWidth = 1
        collectionView.register(CategoryCollectionViewCell.self, forCellWithReuseIdentifier: categoryCellID )
        return collectionView
    }()
    
    // MARK: - Initializers
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        backgroundColor = Stylesheet.Colors.UltraLightGray
        addSubviews()
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Functions
    private func setupView(){
        setupCategoryCollectionView()
        setupFeedCollectionView()
    }
    
    private func addSubviews() {
        addSubview(categoryCollectionView)
        addSubview(feedCollectionView)
    }
    
    private func setupCategoryCollectionView() {
        categoryCollectionView.snp.makeConstraints { (make) in
            make.top.equalTo(snp.top)
            make.width.equalTo(self)
            make.centerX.equalTo(self)
            make.height.equalTo(self).multipliedBy(0.09)
        }
    }
    
    private func setupFeedCollectionView() {
        feedCollectionView.snp.makeConstraints { (make) in
            make.top.equalTo(categoryCollectionView.snp.bottom)
            make.width.equalTo(self)
            make.centerX.equalTo(self)
            make.height.equalTo(self).multipliedBy(0.91)
        }
    }
    
}


