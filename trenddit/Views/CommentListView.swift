//
//  UserCommentView.swift
//  trenddit
//
//  Created by Ashlee Krammer on 2/1/18.
//  Copyright © 2018 C4Q. All rights reserved.
//

import UIKit
import SnapKit

class CommentListView: UIView {

    //Purpose:  (Table View With List Of Comments and TF on Bottom)
    
    //Top Left: Table View with two custom cells
    lazy var tableView: UITableView = {
        var tv = UITableView()
        return tv
    }()
    
    //Bottom: Comment Text Field that opens Comment View
    lazy var commentTextField: UITextField = {
        var tf = UITextField()
        tf.placeholder = "Comment..."
        return tf
    }()
    
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        setUpView()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func setUpView() {
        addTableView()
        addCommentTextField()
    }
    
    func addTableView() {
        addSubview(tableView)
        tableView.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(safeAreaLayoutGuide.snp.top).offset(20)
        }
    }
    
    func addCommentTextField() {
        addSubview(commentTextField)
        commentTextField.snp.makeConstraints { (make) -> Void in
            make.bottom.equalTo(safeAreaLayoutGuide.snp.bottom).offset(-10)
            make.leading.trailing.equalTo(safeAreaLayoutGuide)
        }
    }


}
