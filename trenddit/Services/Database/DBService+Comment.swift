//
//  DBService+Comment.swift
//  trenddit
//
//  Created by Masai Young on 2/8/18.
//  Copyright © 2018 C4Q. All rights reserved.
//

import Foundation
extension DBService {
    public func addComment(text: String, post: Post) {
        guard let userId = AuthClient.currentUser?.uid else { return }
        guard let displayName = AuthClient.currentUser?.displayName else { return }
        let params: [String: Any] = ["commentText"   : text,
                                     "date"     : post.date,
                                     "postID"   : post.postID,
                                     "creator"  : displayName,
                                     "category" : post.category,
                                     "userID"   : userId]
        DBService.manager.getComments().childByAutoId().setValue(params) { (error, dbRef) in
            if let error = error {
                print("error adding comment with error: \(error)")
            } else {
                let postRef = DBService.manager.getPosts().child(post.postID)
                let newCommentAmount = post.amountOfComments + 1
                postRef.updateChildValues(["amountOfComments": newCommentAmount] )
                print("added comment successfully @ dbRef: \(dbRef)")
            }
        }
        
        
    }
    
}

