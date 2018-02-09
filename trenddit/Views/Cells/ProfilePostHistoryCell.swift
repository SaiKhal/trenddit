//
//  ProfilePostHistoryCell.swift
//  trenddit
//
//  Created by Clint Mejia on 2/9/18.
//  Copyright © 2018 C4Q. All rights reserved.
//

import UIKit

class ProfilePostHistoryCell: UICollectionViewCell {
    
    // MARK: - Outlets
    lazy var postImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "feedPlaceHolder")
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.isUserInteractionEnabled = true
//        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(postImageView))
//        imageView.addGestureRecognizer(tapRecognizer)
        return imageView
    }()
    
     //MARK: - Initializers
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        commonInit()
        addSubviews()
        setupViews()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
        addSubviews()
        setupViews()
    }
    
    private func commonInit() {
        backgroundColor = Stylesheet.Colors.White
    }
    
    private func addSubviews() {
        addSubview(postImageView)
    }
    
    private func setupViews() {
        setupProfileImageView()
    }
    
    // MARK: - Contraint
    private func setupProfileImageView() {
        postImageView.snp.makeConstraints { (make) -> Void in
            make.edges.equalTo(self)
            make.height.width.equalTo(self)
        }
    }
    
//    public func configureFeedCell(with postInfo: Post) {
//        if let photoUrl = URL(string: postInfo.userPhotoURL) {
//            profileImageView.kf.setImage(with: photoUrl)
//        }
//        postImageView.kf.setImage(with: URL(string: postInfo.image!), placeholder: #imageLiteral(resourceName: "feedPlaceHolder"))
//        userNameButton.setTitle(postInfo.creator, for: .normal)
//        titleButton.setTitle(postInfo.title, for: .normal)
//        postCategoryButton.setTitle(postInfo.category.reduce("", {$0 + $1 + " "}), for: .normal)
//        totalVotesLabel.text = String(postInfo.totalVotes)
//        totalRepliesLabel.text = String(postInfo.comments?.count ?? 0)
//    }
    
}




