//
//  CommentView.swift
//  trenddit
//
//  Created by Ashlee Krammer on 2/1/18.
//  Copyright © 2018 C4Q. All rights reserved.
//

import UIKit
import SnapKit

class CommentInputView: UIView {

    //Purpose: (Reuse Comment View)
    
    lazy var dismissButton: UIButton = {
        var btn = UIButton()
        btn.setImage(#imageLiteral(resourceName: "close"), for: .normal)
        return btn
    }()
    
    lazy var sendButton: UIButton = {
        var btn = UIButton()
        btn.setImage(#imageLiteral(resourceName: "share"), for: .normal)
        return btn
    }()
    
    lazy var postTitleLabel: UILabel = {
        var label = UILabel()
        label.text = "Cats vs Dogs: Which can run faster"
        label.font = UIFont.systemFont(ofSize: 25, weight: .regular)
        label.numberOfLines = 3
        label.layer.borderColor = UIColor.lightGray.cgColor
        return label
    }()
    
    lazy var createCommentTV: UITextView = {
        var tv = UITextView()
        tv.layer.borderColor = UIColor.lightGray.cgColor
        tv.layer.cornerRadius = 5
        tv.clipsToBounds = true
        tv.layer.borderWidth = 1.0
        tv.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        return tv
    }()
    
    lazy var characterCountLabel: UILabel = {
        var label = UILabel()
        label.text = "Write your comment"
        return label
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        setUpView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func setUpView() {
        setUpDismissButton()
        setUpSendButton()
        setUpTitleLabel()
        setUpCommentTF()
        setUpCharCountLabel()
    }
    
    func setUpDismissButton() {
        addSubview(dismissButton)
        dismissButton.snp.makeConstraints { (make) in
            make.top.equalTo(safeAreaLayoutGuide.snp.top).offset(15)
            make.leading.equalTo(safeAreaLayoutGuide).offset(5)
        }
    }
    
    func setUpSendButton() {
        addSubview(sendButton)
        sendButton.snp.makeConstraints { (make) in
            make.top.equalTo(safeAreaLayoutGuide.snp.top).offset(15)
            make.trailing.equalTo(safeAreaLayoutGuide).offset(-5)
        }
    }
    
    func setUpTitleLabel() {
        addSubview(postTitleLabel)
        postTitleLabel.snp.makeConstraints { (make) in
            make.top.equalTo(dismissButton.snp.bottom).offset(10)
            make.leading.equalTo(safeAreaLayoutGuide.snp.leading).offset(5)
            make.trailing.equalTo(safeAreaLayoutGuide.snp.trailing).offset(-5)
            make.height.equalTo(safeAreaLayoutGuide).multipliedBy(0.1)
        }
    }
    
    func setUpCommentTF() {
        addSubview(createCommentTV)
        createCommentTV.snp.makeConstraints { (make) in
            make.top.equalTo(postTitleLabel.snp.bottom).offset(8)
            make.leading.equalTo(safeAreaLayoutGuide.snp.leading).offset(5)
            make.trailing.equalTo(safeAreaLayoutGuide.snp.trailing).offset(-5)
            make.height.equalTo(safeAreaLayoutGuide).multipliedBy(0.3)
        }
    }
    
    func setUpCharCountLabel() {
        addSubview(characterCountLabel)
        characterCountLabel.snp.makeConstraints { (make) in
            make.top.equalTo(createCommentTV.snp.bottom).offset(5)
            make.leading.equalTo(safeAreaLayoutGuide.snp.leading).offset(5)
            make.trailing.equalTo(safeAreaLayoutGuide.snp.trailing).offset(-5)
        }
    }

}
