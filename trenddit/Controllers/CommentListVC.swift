//
//  CommentListVC.swift
//  trenddit
//
//  Created by Ashlee Krammer on 2/1/18.
//  Copyright © 2018 C4Q. All rights reserved.
//

import UIKit
import FirebaseDatabase

class CommentListVC: UIViewController{
    
    //Purpose: (Controls Comment View)
    var commentListView = CommentListView()
    var post: Post!
    var comments: [Comment]? {
        didSet {
            commentListView.tableView.reloadData()
        }
    }
    
    convenience init(post: Post) {
        self.init()
        self.post = post
    }
    
    //View Did Load
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(commentListView)
        commentListView.tableView.delegate = self
        commentListView.tableView.dataSource = self
        getComments(post: post)
        commentListView.tableView.register(DisplayPostCell.self, forCellReuseIdentifier: "DisplayPostCell")
        commentListView.tableView.register(CommentListCell.self, forCellReuseIdentifier: "CommentListCell")
        commentListView.commentTextField.delegate = self
    }
    
    func getComments(post: Post) {
        DBService.manager.getComments().queryOrdered(byChild: "postID").queryEqual(toValue: post.postID).observe(.value) { (snapshot) in
            var comments = [Comment]()
            for child in snapshot.children {
                let dataSnapshot = child as! DataSnapshot
                if let dict = dataSnapshot.value as? [String : Any] {
                    let comment = Comment.init(commentDict: dict)
                    comments.append(comment)
                    self.comments = comments
                }
            }
        }
    }

}

extension CommentListVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0:
            return 350
        default:
            return 150
            
        }
    }
}

extension CommentListVC: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        case 1:
            return comments?.count ?? 0
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "DisplayPostCell", for: indexPath) as! DisplayPostCell
            guard let comment = comments?[indexPath.row] else { return cell }
            cell.selectionStyle = .none
            cell.layer.borderColor = UIColor.lightText.cgColor
            cell.layer.borderWidth = 1.0
            cell.layer.cornerRadius = 5
            cell.clipsToBounds = true
            cell.delegate = self
            cell.userNameLabel.text = comment.creator
            return cell
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: "CommentListCell", for: indexPath) as! CommentListCell
            guard let comment = comments?[indexPath.row] else { return cell }
            cell.selectionStyle = .none
            cell.commentTV.text = comment.commentText
            cell.userNameLabel.text = comment.creator
            
            return cell
        }
    }
}

extension CommentListVC: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        guard let commentText = textField.text, !commentText.isEmpty else { return false }
        print("postid: \(post.postID)")
        DBService.manager.addComment(text: commentText, post: post)
        return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
    //when clicked, display comment input view
        present(CommentInputViewController(post: post), animated: true, completion: nil)
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        //if you reach max characters for comment input view 
        return true
    }
    
}

extension CommentListVC: Router {
    func route(destination: UIViewController?) {
        dismiss(animated: true, completion: nil)
    }
}
