//
//  CommentListCell.swift
//  trenddit
//
//  Created by Ashlee Krammer on 2/5/18.
//  Copyright © 2018 C4Q. All rights reserved.
//

import UIKit

class CommentListCell: UITableViewCell {

    lazy var userNameLabel: UILabel = {
        var label = UILabel()
        label.text = "catterific • catLover89 • 3hr"
        label.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        return label
    }()
    
    lazy var commentTV: UITextView = {
        var tv = UITextView()
        tv.layer.borderColor = UIColor.lightGray.cgColor
        tv.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        tv.text = "Cats are absolutely awesome. Did you know that there are many breeds of cats. Soooo many cats. Did you know that cats hover. Cats love hoomans"
        tv.isEditable = false
        tv.isScrollEnabled = false
        return tv
    }()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUpView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
    }
    
    func setUpView() {
        setUpUserNameLabel()
        setUpCommentTF()
        
    }
    
    func setUpUserNameLabel() {
        addSubview(userNameLabel)
        userNameLabel.snp.makeConstraints { (make) in
            make.top.equalTo(safeAreaLayoutGuide.snp.top).offset(10)
            make.leading.equalTo(safeAreaLayoutGuide.snp.leading).offset(5)
            make.trailing.equalTo(safeAreaLayoutGuide.snp.trailing).offset(-5)
            make.height.equalTo(safeAreaLayoutGuide).multipliedBy(0.2)
        }
    }
    
    func setUpCommentTF() {
        addSubview(commentTV)
        commentTV.snp.makeConstraints { (make) in
            make.top.equalTo(userNameLabel.snp.bottom).offset(8)
            make.leading.equalTo(safeAreaLayoutGuide.snp.leading).offset(5)
            make.trailing.equalTo(safeAreaLayoutGuide.snp.trailing).offset(-5)
            make.height.equalTo(safeAreaLayoutGuide).multipliedBy(0.7)
        }
    }

}
