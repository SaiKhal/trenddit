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
        button.setTitleColor(UIColor.black, for: .normal)
        button.setTitleColor(UIColor.red, for: .selected)
        button.setTitle("username", for: .normal)
        button.contentHorizontalAlignment = .left
        button.titleLabel?.font = button.titleLabel?.font.withSize(12)
        return button
    }()
    
    lazy var postCategoryButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .white
        button.setTitleColor(UIColor.black, for: .normal)
        button.setTitleColor(UIColor.red, for: .selected)
        button.setTitle("category", for: .normal)
        button.contentHorizontalAlignment = .left
        button.titleLabel?.font = button.titleLabel?.font.withSize(12)
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
        label.font = UIFont.systemFont(ofSize: 9, weight: .regular)
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
        label.font = UIFont.systemFont(ofSize: 9, weight: .regular)
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
        label.font = UIFont.systemFont(ofSize: 9, weight: .regular)
        return label
    }()
    
    //MARK: - Initializers
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        commonInit()
        addSubviews()
        setupViews()
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
        backgroundColor = .white
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
            make.leading.equalTo(snp.leading)
            make.height.width.equalTo(self).multipliedBy(0.15)
        }
    }
    
    private func setupUserNameButton() {
        userNameButton.snp.makeConstraints { (make) in
            make.top.equalTo(profileImageView.snp.top).offset(2)
            make.leading.equalTo(profileImageView.snp.trailing).offset(10)
            make.height.equalTo(profileImageView.snp.height).multipliedBy(0.3)
            make.width.equalTo(self).multipliedBy(0.3)
        }
    }

    private func setupPostCategoryButton() {
        postCategoryButton.snp.makeConstraints { (make) in
            make.top.equalTo(userNameButton.snp.bottom).offset(5)
            make.leading.equalTo(profileImageView.snp.trailing).offset(10)
            make.height.equalTo(profileImageView.snp.height).multipliedBy(0.3)
            make.width.equalTo(self).multipliedBy(0.3)
        }
    }

    private func setupPostOptionsButton() {
        postOptionsButton.snp.makeConstraints { (make) in
            make.top.equalTo(profileImageView.snp.top)
            make.trailing.equalTo(snp.trailing).inset(5)
            make.width.equalTo(self).multipliedBy(0.05)
            make.height.equalTo(self).multipliedBy(0.08)
        }
    }

    private func setupTitleLabel() {
        titleLabel.snp.makeConstraints { (make) in
            make.top.equalTo(profileImageView.snp.bottom).offset(5)
            make.leading.equalTo(profileImageView.snp.leading).offset(13)
            make.width.equalTo(self)
        }
    }

    private func setupPostImageView() {
        postImageView.snp.makeConstraints { (make) in
            make.top.equalTo(titleLabel.snp.bottom).offset(5)
            make.width.equalTo(self)
            make.height.equalTo(self).multipliedBy(0.6)
            make.centerX.equalTo(self)
        }
    }

    private func setupUpVoteButton() {
        upVoteButton.snp.makeConstraints { (make) in
            make.top.equalTo(postImageView.snp.bottom).offset(8)
            make.leading.equalTo(titleLabel.snp.leading)
            make.height.equalTo(self).multipliedBy(0.05)
            make.width.equalTo(self).multipliedBy(0.037)
        }
    }

    private func setupTotalVotesLabel() {
        totalVotesLabel.snp.makeConstraints { (make) in
            make.centerY.equalTo(upVoteButton.snp.centerY)
            make.leading.equalTo(upVoteButton.snp.trailing).offset(8)
            make.height.equalTo(upVoteButton).multipliedBy(0.8)
        }
    }

    private func setupDownVoteButton() {
        downVoteButton.snp.makeConstraints { (make) in
            make.top.equalTo(postImageView.snp.bottom).offset(8)
            make.leading.equalTo(totalVotesLabel.snp.trailing).offset(8)
            make.height.equalTo(self).multipliedBy(0.05)
            make.width.equalTo(self).multipliedBy(0.037)
        }
    }

    private func setupReplyToPostButton() {
        replyToPostButton.snp.makeConstraints { (make) in
            make.top.equalTo(postImageView.snp.bottom).offset(8)
            make.leading.equalTo(snp.centerX).inset(-10)
            make.height.equalTo(self).multipliedBy(0.05)
            make.width.equalTo(self).multipliedBy(0.037)
        }
    }

    private func setupTotalRepliesLabel() {
        totalRepliesLabel.snp.makeConstraints { (make) in
            make.centerY.equalTo(upVoteButton.snp.centerY)
            make.leading.equalTo(replyToPostButton.snp.trailing).offset(8)
            make.height.equalTo(upVoteButton).multipliedBy(0.8)
        }
    }

    private func setupShareButton() {
        shareButton.snp.makeConstraints { (make) in
            make.top.equalTo(postImageView.snp.bottom).offset(8)
            make.trailing.equalTo(shareLabel.snp.leading).inset(-10)
            make.height.equalTo(self).multipliedBy(0.05)
            make.width.equalTo(self).multipliedBy(0.037)
        }
    }

    private func setupShareLabel() {
        shareLabel.snp.makeConstraints { (make) in
            make.centerY.equalTo(upVoteButton.snp.centerY)
            make.leading.equalTo(self.snp.trailing).inset(40)
            make.height.equalTo(upVoteButton).multipliedBy(0.8)
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
