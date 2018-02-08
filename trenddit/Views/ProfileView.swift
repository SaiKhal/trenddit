//
//  ProfileView.swift
//  trenddit
//
//  Created by Masai Young on 2/4/18.
//  Copyright © 2018 C4Q. All rights reserved.
//

import UIKit
import SnapKit

class ProfileView: UIView {
    
    lazy var statStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [UILabel(), UILabel()])
        stack.alignment = .center
        stack.axis = .vertical
        stack.spacing = 0
        let stats = UIStackView(arrangedSubviews: [stack, stack, stack])
        stats.alignment = .center
        stats.axis = .horizontal
        stats.spacing = 10
        return stack
    }()
    
    lazy var editButton: UIButton = {
        let bttn = UIButton()
        bttn.backgroundColor = .green
        return bttn
    }()
    
    lazy var profileImageView: UIImageView = {
        let width: CGFloat = UIScreen.main.bounds.width * 0.25
        let iv = UIImageView()
        iv.backgroundColor = .orange
        iv.layer.cornerRadius = 80
        iv.layer.masksToBounds = true
        return iv
    }()
    
    lazy var profileStack: UIStackView = {
        let sideStack = UIStackView(arrangedSubviews: [statStack, editButton])
        sideStack.alignment = .center
        sideStack.axis = .vertical
        sideStack.spacing = 10
        let finalStack = UIStackView(arrangedSubviews: [profileImageView, sideStack])
        finalStack.alignment = .center
        finalStack.axis = .horizontal
        finalStack.spacing = 10
        return finalStack
    }()
    
    lazy var feedCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let collectionView = UICollectionView(frame: self.bounds, collectionViewLayout: layout)
        let screenHeight: CGFloat = UIScreen.main.bounds.height
        let screenWidth: CGFloat = UIScreen.main.bounds.width
        let cellSpacing: CGFloat = 15.0
        let numberOfCells: CGFloat = 3
        let numberOfSpaces: CGFloat = numberOfCells + 1
        layout.itemSize = CGSize(width: (screenWidth - (cellSpacing * numberOfSpaces)) / numberOfCells, height: screenHeight * 0.25)
        layout.sectionInset = UIEdgeInsetsMake(cellSpacing, cellSpacing , cellSpacing, cellSpacing )
        layout.minimumLineSpacing = cellSpacing
        layout.minimumInteritemSpacing = cellSpacing
        collectionView.backgroundColor = .orange
        collectionView.register(FeedCollectionViewCell.self, forCellWithReuseIdentifier: "FeedCollectionViewCell")
        return collectionView
    }()
    
    // Init
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError()
    }
    
    func commonInit() {
        setupCollectionView()
        self.backgroundColor = .purple
    }
    
    func setupCollectionView() {
        self.addSubview(feedCollectionView)
        feedCollectionView.snp.makeConstraints { (make) in
//            make.edges.equalTo(self.snp.edges)
            make.top.equalTo(self.snp.top)
            make.bottom.equalTo(self.snp.bottom)
        }
    }
    
}
