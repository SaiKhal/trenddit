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
    
    //Nav Bar:
    //Left: Cancel
    //Right: Send
    
    //Top Body:
    //Post Title In Large Label
    //Text Field for comment
    lazy var postTitleLabel: UILabel = {
        var label = UILabel()
        label.text = "Post Title"
        label.numberOfLines = 3
        return label
    }()
    
    lazy var createCommentTF: UITextField = {
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
        setUpTitleLabel()
        setUpCommentTF()
    }
    
    func setUpTitleLabel() {
    }
    
    func setUpCommentTF() {
    }


}
