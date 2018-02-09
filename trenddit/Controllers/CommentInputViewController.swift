//
//  CommentInputViewController.swift
//  trenddit
//
//  Created by Masai Young on 2/9/18.
//  Copyright © 2018 C4Q. All rights reserved.
//

import UIKit

class CommentInputViewController: UIViewController {
    
    var commentInput = CommentInputView()
    var post: Post!
    convenience init(post: Post) {
        self.init()
        self.post = post
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(commentInput)
        view.backgroundColor = .orange
        commentInput.dismissButton.addTarget(self, action: #selector(dismissCommentIV), for: .touchUpInside)
        commentInput.sendButton.addTarget(self, action: #selector(sendComment), for: .touchUpInside)
    }
    
    @objc private func dismissCommentIV() {
        dismiss(animated: true, completion: nil)
        print("hi")
    }
    
    @objc private func sendComment() {
        guard let commentText = commentInput.createCommentTV.text else {return}
        DBService.manager.addComment(text: commentText, post: post)
        dismiss(animated: true, completion: nil)
        print("clicked send comment")
    }
    
    
}

