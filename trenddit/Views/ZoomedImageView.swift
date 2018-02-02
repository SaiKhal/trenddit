//
//  ZoomedImageView.swift
//  trenddit
//
//  Created by Ashlee Krammer on 2/1/18.
//  Copyright © 2018 C4Q. All rights reserved.
//

import UIKit
import SnapKit

class ZoomedImageView: UIView {

    //Purpose: (Image Zoomed In)
    
    //Top: User Post Name
    lazy var userNameLabel: UILabel = {
       var lb = UILabel()
        lb.text = "Posting User's Name & Hours Posted"
        return lb
    }()
    
    //Center: Image/Video
    lazy var postImage: UIImageView = {
       var img = UIImageView()
        img.image = #imageLiteral(resourceName: "postplaceholderimage")
        return img
    }()
    
    //Bottom: Like Button & Count Label & Dislike Button || Comment Button
    lazy var likeButton: UIButton = {
        var btn = UIButton()
        btn.setImage(#imageLiteral(resourceName: "upVoteWhite"), for: .normal)
       return btn
    }()
    
    lazy var dislikeButton: UIButton = {
        var btn = UIButton()
        btn.setImage(#imageLiteral(resourceName: "downVoteWhite"), for: .normal)
        return btn
    }()
    
    lazy var commentButton: UIButton = {
       var btn = UIButton()
        btn.setImage(#imageLiteral(resourceName: "commentWhite"), for: .normal)
        return btn
    }()
    
    //Functionality to Buttons in VC
    
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        setUpZoomedView()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    
    func setUpZoomedView() {
      setUpUserPostLabel()
        setUpPostImage()
        setUpLikeButton()
        setUpDislikeButton()
        setUpCommentButton()
    }
    
    func setUpUserPostLabel() {
        addSubview(userNameLabel)
        userNameLabel.snp.makeConstraints { (make) in
            make.top.equalTo(safeAreaLayoutGuide).offset(8)
            make.leading.equalTo(safeAreaLayoutGuide.snp.leading)
        }
    }
    
    func setUpPostImage() {
        addSubview(postImage)
        postImage.snp.makeConstraints { (make) in
            make.centerX.equalTo(snp.centerX)
            make.centerY.equalTo(snp.centerY)
            make.left.equalTo(snp.left)
            make.right.equalTo(snp.right)
        }
    }
    
    func setUpLikeButton() {
        addSubview(likeButton)
        likeButton.snp.makeConstraints { (make) in
            make.leading.equalTo(snp.leading).offset(5)
            make.bottom.equalTo(snp.bottom).offset(-5)
        }
    }
    
    func setUpDislikeButton() {
        addSubview(dislikeButton)
    }
    
    func setUpCommentButton() {
        addSubview(commentButton)
    }
    

}
