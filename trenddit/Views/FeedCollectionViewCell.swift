//
//  FeedCollectionViewCell.swift
//  trenddit
//
//  Created by Clint M on 1/31/18.
//  Copyright © 2018 C4Q. All rights reserved.
//

import UIKit
import SnapKit

class FeedCollectionViewCell: UICollectionViewCell {
    
    // TODO: Add button targets. Complete configure cell function
    
    // MARK: - Outlets
    lazy var profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "user")
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        return imageView
    }()
    
    lazy var userNameButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .white
        button.setTitleColor(UIColor.white, for: .normal)
        button.setTitleColor(UIColor.blue, for: .selected)
        button.titleLabel?.text = "userName"
        button.titleLabel?.textAlignment = .center
        return button
    }()
    
    lazy var postCategoryButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .white
        button.setTitleColor(UIColor.white, for: .normal)
        button.setTitleColor(UIColor.blue, for: .selected)
        button.titleLabel?.text = "category"
        button.titleLabel?.textAlignment = .center
        return button
    }()
    
    lazy var postOptionsButton: UIButton = {
        let button = UIButton(type: UIButtonType.custom) as UIButton
        button.setImage(#imageLiteral(resourceName: "more"), for: .normal)
//        button.addTarget(<#T##target: Any?##Any?#>, action: <#T##Selector#>, for: <#T##UIControlEvents#>)
        return button
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "this is the post header"
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        return label
    }()
    
    lazy var postImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "feedPlaceHolder")
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        return imageView
    }()
    
    lazy var upVoteButton: UIButton = {
        let button = UIButton(type: UIButtonType.custom) as UIButton
        button.setImage(#imageLiteral(resourceName: "up-arrow"), for: .normal)
//        button.addTarget(<#T##target: Any?##Any?#>, action: <#T##Selector#>, for: <#T##UIControlEvents#>)
        return button
    }()
    
    lazy var totalVotesLabel: UILabel = {
        let label = UILabel()
        label.text = "13.1k"
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        return label
    }()
    
    lazy var downVoteButton: UIButton = {
        let button = UIButton(type: UIButtonType.custom) as UIButton
        button.setImage(#imageLiteral(resourceName: "down-arrow"), for: .normal)
//        button.addTarget(<#T##target: Any?##Any?#>, action: <#T##Selector#>, for: <#T##UIControlEvents#>)
        return button
    }()
    
    lazy var replyToPostButton: UIButton = {
        let button = UIButton(type: UIButtonType.custom) as UIButton
        button.setImage(#imageLiteral(resourceName: "chat"), for: .normal)
//        button.addTarget(<#T##target: Any?##Any?#>, action: <#T##Selector#>, for: <#T##UIControlEvents#>)
        return button
    }()
    
    lazy var totalRepliesLabel: UILabel = {
        let label = UILabel()
        label.text = "253"
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        return label
    }()
    
    lazy var shareButton: UIButton = {
        let button = UIButton(type: UIButtonType.custom) as UIButton
        button.setImage(#imageLiteral(resourceName: "share"), for: .normal)
//        button.addTarget(<#T##target: Any?##Any?#>, action: <#T##Selector#>, for: <#T##UIControlEvents#>)
        return button
    }()
    
    lazy var shareLabel: UILabel = {
        let label = UILabel()
        label.text = "Share"
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        return label
    }()
    
    //MARK: - Initializers
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        commonInit()
    }
    
    // required. Storyboard
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
        addSubviews()
        setupViews()
    }
    
    //MARK: - Functions
    private func commonInit() {
        backgroundColor = .yellow
    }
    
    private func addSubviews() {
        addSubview(profileImageView)
        addSubview(userNameButton)
        addSubview(postCategoryButton)
        addSubview(postOptionsButton)
        addSubview(titleLabel)
        addSubview(postImageView)
        addSubview(upVoteButton)
        addSubview(totalVotesLabel)
        addSubview(downVoteButton)
        addSubview(replyToPostButton)
        addSubview(totalRepliesLabel)
        addSubview(shareButton)
        addSubview(shareLabel)
    }
    
    private func setupViews() {
        setupProfileImageView()
        setupUserNameButton()
        setupPostCategoryButton()
        setupPostOptionsButton()
        setupTitleLabel()
        setupPostImageView()
        setupUpVoteButton()
        setupTotalVotesLabel()
        setupDownVoteButton()
        setupReplyToPostButton()
        setupTotalRepliesLabel()
        setupShareButton()
        setupShareLabel()
    }
    
    // MARK: - Snapkit constraints
    private func setupProfileImageView() {
        profileImageView.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(snp.top).offset(10)
            make.leading.equalTo(snp.leading).offset(20)
            make.height.width.equalTo(self).multipliedBy(0.20)
        }
    }
    
    private func setupUserNameButton() {
        userNameButton.snp.makeConstraints { (make) in
            make.top.equalTo(snp.top).offset(15)
            make.leading.equalTo(profileImageView.snp.trailing).offset(10)
            make.height.equalTo(profileImageView.snp.height).multipliedBy(0.5)
            make.width.equalTo(self).multipliedBy(0.3)
        }
    }
    
    private func setupPostCategoryButton() {
        postCategoryButton.snp.makeConstraints { (make) in
            make.top.equalTo(userNameButton.snp.top).offset(5)
            make.leading.equalTo(profileImageView.snp.trailing).offset(10)
            make.height.equalTo(profileImageView.snp.height).multipliedBy(0.5)
            make.width.equalTo(self).multipliedBy(0.3)
        }
    }
    
    private func setupPostOptionsButton() {
        postOptionsButton.snp.makeConstraints { (make) in
            make.top.equalTo(userNameButton.snp.top).offset(5)
            make.trailing.equalTo(snp.trailing).offset(-20)
            make.width.height.equalTo(self).multipliedBy(0.3)
        }
    }
    
    private func setupTitleLabel() {
        titleLabel.snp.makeConstraints { (make) in
            make.bottom.equalTo(profileImageView.snp.bottom).offset(20)
            make.leading.equalTo(profileImageView.snp.leading)
            make.width.height.equalTo(profileImageView.snp.height).multipliedBy(0.9)
        }
    }
    
    private func setupPostImageView() {
        postImageView.snp.makeConstraints { (make) in
            make.top.equalTo(titleLabel.snp.bottom).offset(15)
            make.width.equalTo(self)
            make.height.equalTo(self).multipliedBy(0.45)
            make.centerX.equalTo(self)
        }
    }
    
    private func setupUpVoteButton() {
        upVoteButton.snp.makeConstraints { (make) in
            make.top.equalTo(postImageView.snp.bottom).offset(15)
            make.leading.equalTo(titleLabel.snp.leading)
            make.width.height.equalTo(self).multipliedBy(0.3)
        }
    }
    
    private func setupTotalVotesLabel() {
        totalVotesLabel.snp.makeConstraints { (make) in
            make.centerY.equalTo(upVoteButton.snp.height)
            make.leading.equalTo(upVoteButton.snp.trailing).offset(15)
            make.width.height.equalTo(upVoteButton).multipliedBy(0.8)
        }
    }
    
    private func setupDownVoteButton() {
        downVoteButton.snp.makeConstraints { (make) in
            make.top.equalTo(postImageView.snp.bottom).offset(15)
            make.leading.equalTo(totalVotesLabel.snp.trailing).offset(15)
            make.width.height.equalTo(self).multipliedBy(0.3)
        }
    }
    
    private func setupReplyToPostButton() {
        replyToPostButton.snp.makeConstraints { (make) in
            make.top.equalTo(postImageView.snp.top).offset(15)
            make.centerX.equalTo(self)
            make.width.height.equalTo(self).multipliedBy(0.3)
        }
    }
    
    private func setupTotalRepliesLabel() {
        shareButton.snp.makeConstraints { (make) in
            make.top.equalTo(postImageView.snp.bottom).offset(15)
            make.leading.equalTo(replyToPostButton.snp.trailing).offset(15)
            make.width.height.equalTo(replyToPostButton).multipliedBy(0.8)
        }
    }
    
    private func setupShareButton() {
        shareButton.snp.makeConstraints { (make) in
            make.top.equalTo(postImageView.snp.top).offset(15)
            make.trailing.equalTo(shareLabel.snp.leading).offset(-15)
            make.width.height.equalTo(self).multipliedBy(0.3)
        }
    }
    
    private func setupShareLabel() {
        shareLabel.snp.makeConstraints { (make) in
            make.centerY.equalTo(upVoteButton.snp.height)
            make.trailing.equalTo(self).offset(-25)
            make.width.height.equalTo(replyToPostButton).multipliedBy(0.8)
        }
    }
    
    // configure cell from viewController
//    public func configureFeedCell(with details: String, and userProfileImage: UIImage) {
//        profileImageView.image = userProfileImage
//        userNameButton.titleLabel?.text = text
//        postCategoryButton.titleLabel?.text = text
//        titleLabel.text = text
//        postImageView.image = image
//        totalVotesLabel.text = text
//        totalRepliesLabel.text = text
//    }
//    
}
