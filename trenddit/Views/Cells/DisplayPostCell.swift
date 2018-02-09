//
//  DisplayPostCell.swift
//  trenddit
//
//  Created by Ashlee Krammer on 2/5/18.
//  Copyright © 2018 C4Q. All rights reserved.
//

import UIKit

class DisplayPostCell: UITableViewCell {
    
    var delegate: Router!

    @objc func dismissVC() {
        delegate.route(destination: nil)
    }
    
    lazy var userNameLabel: UILabel = {
        var label = UILabel()
        label.text = "catterific • catLover89 • 3hr"
        label.font = UIFont.systemFont(ofSize: 20, weight: .regular)
        return label
    }()
    
    lazy var reportButton: UIButton = {
        var btn = UIButton()
        btn.setImage(#imageLiteral(resourceName: "more"), for: .normal)
        btn.addTarget(self, action: #selector(dismissVC), for: .touchUpInside)
        return btn
    }()
    
    //Center: Image/Video
    lazy var postImage: UIImageView = {
        var img = UIImageView()
        img.image = #imageLiteral(resourceName: "user")
        img.backgroundColor = .black
        img.contentMode = .scaleAspectFit
        return img
    }()
    
    //Bottom: Like Button & Count Label & Dislike Button || Comment Button
    lazy var likeButton: UIButton = {
        var btn = UIButton()
        btn.setImage(#imageLiteral(resourceName: "up-arrow"), for: .normal)
        return btn
    }()
    
    lazy var likeCountLabel: UILabel = {
        var label = UILabel()
        label.text = "3.1K"
        label.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        return label
    }()
    lazy var dislikeButton: UIButton = {
        var btn = UIButton()
        btn.setImage(#imageLiteral(resourceName: "down-arrow"), for: .normal)
        btn.backgroundColor = .white
        return btn
    }()
    
    lazy var commentButton: UIButton = {
        var btn = UIButton()
        btn.setImage(#imageLiteral(resourceName: "chat"), for: .normal)
        btn.backgroundColor = .white
        return btn
    }()
    
    lazy var shareButton: UIButton = {
        var btn = UIButton()
        btn.setImage(#imageLiteral(resourceName: "share"), for: .normal)
        btn.backgroundColor = .white
        return btn
    }()
    
    //Functionality to Buttons in VC
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setUpViews()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setUpViews()
    }
    
    func setUpViews() {
        setUpUserPostLabel()
        setUpReportButton()
        setUpPostImage()
        setUpLikeButton()
        setUpLikeCountLabel()
        setUpDislikeButton()
        setUpCommentButton()
        setUpShareButton()
    }
    
    
    
    func setUpUserPostLabel() {
        addSubview(userNameLabel)
        userNameLabel.snp.makeConstraints { (make) in
            make.top.equalTo(safeAreaLayoutGuide).offset(20)
            make.leading.equalTo(safeAreaLayoutGuide.snp.leading).offset(5)
            
        }
    }
    
    func setUpReportButton() {
        addSubview(reportButton)
        reportButton.snp.makeConstraints { (make) in
            make.top.equalTo(safeAreaLayoutGuide).offset(20)
            make.trailing.equalTo(safeAreaLayoutGuide.snp.trailing).offset(-5)
            make.height.width.equalTo(self).multipliedBy(0.05)
            
        }
    }
    
    func setUpPostImage() {
        addSubview(postImage)
        postImage.snp.makeConstraints { (make) in
            make.centerX.equalTo(snp.centerX)
            make.centerY.equalTo(snp.centerY)
            make.left.equalTo(snp.left)
            make.right.equalTo(snp.right)
            make.height.equalTo(self).multipliedBy(0.6)
            
        }
    }
    
    func setUpLikeButton() {
        addSubview(likeButton)
        likeButton.snp.makeConstraints { (make) in
            make.leading.equalTo(snp.leading).offset(5)
            make.bottom.equalTo(snp.bottom).offset(-10)
            make.height.width.equalTo(self).multipliedBy(0.05)
            
        }
    }
    
    func setUpLikeCountLabel() {
        addSubview(likeCountLabel)
        likeCountLabel.snp.makeConstraints { (make) in
            make.leading.equalTo(likeButton.snp.trailing).offset(3)
            make.bottom.equalTo(safeAreaLayoutGuide.snp.bottom).offset(-10)
            make.height.equalTo(self).multipliedBy(0.05)
            
            
        }
    }
    
    func setUpDislikeButton() {
        addSubview(dislikeButton)
        dislikeButton.snp.makeConstraints { (make) in
            make.leading.equalTo(likeCountLabel.snp.trailing).offset(3)
            make.bottom.equalTo(safeAreaLayoutGuide.snp.bottom).offset(-10)
            make.height.width.equalTo(self).multipliedBy(0.05)
            
        }
    }
    
    func setUpCommentButton() {
        addSubview(commentButton)
        commentButton.snp.makeConstraints { (make) in
            make.centerX.equalTo(safeAreaLayoutGuide.snp.centerX)
            make.bottom.equalTo(safeAreaLayoutGuide.snp.bottom).offset(-10)
            make.height.width.equalTo(self).multipliedBy(0.05)
            
        }
    }
    
    func setUpShareButton() {
        addSubview(shareButton)
        shareButton.snp.makeConstraints { (make) in
            make.trailing.equalTo(safeAreaLayoutGuide.snp.trailing).offset(-5)
            make.bottom.equalTo(safeAreaLayoutGuide.snp.bottom).offset(-10)
            make.height.width.equalTo(self).multipliedBy(0.05)
            
        }
    }
    
}
