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
    
    lazy var callToActionStack: UIStackView = {
        let stackview = UIStackView(arrangedSubviews: [collectionViewButton, collectionViewButtonUpvotes])
        stackview.alignment = .center
        stackview.axis = .horizontal
        stackview.spacing = 5
        return stackview
    }()
    
    lazy var collectionViewButton: UIButton = {
        let bttn = UIButton()
        bttn.backgroundColor = .green
        return bttn
    }()
    
    lazy var collectionViewButtonUpvotes: UIButton = {
        let bttn = UIButton()
        bttn.backgroundColor = .orange
        return bttn
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
        iv.layer.cornerRadius = self.bounds.width * 0.30 * 0.5
        iv.layer.masksToBounds = true
        return iv
    }()
    
    lazy var segmentedControl: UISegmentedControl = {
        let sc = UISegmentedControl()
        sc.insertSegment(with: #imageLiteral(resourceName: "photo-camera"), at: 0, animated: true)
        sc.insertSegment(with: #imageLiteral(resourceName: "up-arrow"), at: 1, animated: true)
        sc.backgroundColor = Stylesheet.Colors.White
        return sc
    }()
    
    
    lazy var feedCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let collectionView = UICollectionView(frame: self.bounds, collectionViewLayout: layout)
        let screenHeight: CGFloat = UIScreen.main.bounds.height
        let screenWidth: CGFloat = UIScreen.main.bounds.width
        let cellSpacing: CGFloat = 15.0
        let numberOfCells: CGFloat = 2
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
        setupProfileImageView()
        setupEditButton()
        setupSegmentedControl()
        setupCollectionView()
        self.backgroundColor = Stylesheet.Colors.White
    }
    
    func setupSegmentedControl() {
        self.addSubview(callToActionStack)
        callToActionStack.snp.makeConstraints { make in
            make.top.equalTo(editButton.snp.bottom).offset(30)
            make.width.equalTo(self.snp.width)
        }
        
        collectionViewButton.snp.makeConstraints { make in
            make.width.equalTo(self.snp.width).multipliedBy(0.5)
        }
        
        collectionViewButtonUpvotes.snp.makeConstraints { make in
            make.width.equalTo(self.snp.width).multipliedBy(0.5)
        }
        
    }
    
    func setupCollectionView() {
        self.addSubview(feedCollectionView)
        feedCollectionView.snp.makeConstraints { make in
            make.top.equalTo(callToActionStack.snp.bottom)
            make.bottom.equalTo(self.snp.bottom)
            make.left.equalTo(self.snp.left)
            make.right.equalTo(self.snp.right)
        }
    }
    
    func setupProfileImageView() {
        self.addSubview(profileImageView)
        profileImageView.snp.makeConstraints { make in
            make.top.equalTo(self.safeAreaLayoutGuide.snp.top).offset(40)
            make.left.equalTo(self.snp.left).offset(20)
            make.size.equalTo(self.snp.width).multipliedBy(0.3)

        }
    }
    
    func setupEditButton() {
        self.addSubview(editButton)
        editButton.snp.makeConstraints { make in
            make.bottom.equalTo(profileImageView.snp.bottom)
            make.left.equalTo(profileImageView.snp.right).offset(20)
            make.width.equalTo(self.snp.width).multipliedBy(0.5)
        }
    }
    
}
