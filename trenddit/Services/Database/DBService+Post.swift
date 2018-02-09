//
//  DBService+Post.swift
//  trenddit
//
//  Created by Masai Young on 2/7/18.
//  Copyright © 2018 C4Q. All rights reserved.
//

import Foundation
import UIKit
import FirebaseDatabase

extension DBService {
    public func addPost(title: String, category: Set<String>, image: UIImage) {
        let dateCreated = ISO8601DateFormatter().string(from: Date())
        guard let userId = AuthClient.currentUser?.uid else { fatalError("uid is nil")}
        guard let displayName = AuthClient.currentUser?.displayName else { fatalError("displayName is nil") }
        guard let currentUser = AuthClient.currentUser else { fatalError("not logged in")}
        
        let childByAutoId = DBService.manager.getPosts().childByAutoId()
        childByAutoId.setValue(["postID"         : childByAutoId.key,
                                "userID"        : userId,
                                "title"         : title,
                                "creator"       : displayName,
                                "userPhotoUrl"  : currentUser.photoURL?.absoluteString ?? "",
                                "category"      : Array(category),
                                "dateCreated"   : dateCreated,
                                "upvotes"       : 0,
                                "downvotes"     : 0,
                                "totalVotes"    : 0,
                                "amountOfComments": 0,
                                "flagged"       : false]) { (error, dbRef) in
                                    if let error = error {
                                        print("addJob error: \(error)")
                                    } else {
                                        print("job added to database reference: \(dbRef)")
                                        
                                        // add an image to storage
                                        StorageService.manager.storeImage(image: image, postId: childByAutoId.key)
                                        
                                        // TODO: add image to database
                                        
                                        // add job id to user
//                                        DBService.manager.addJobId(jobId: childByAutoId.key, jobTitle: title, isCreator: true)
                                    }
        }
    }
    
    //storage plu simage
    //child user id and another child
    public func incrementTotalVotes(post: Post) {
        let postRef = DBService.manager.getPosts().child(post.postID)
        let incrementVote = post.totalVotes + 1
        let newUpvoteValue = post.upvotes + 1
        postRef.updateChildValues(["totalVotes": incrementVote] )
        postRef.updateChildValues(["upvotes": newUpvoteValue] )
        print("post \(post.postID) has been upvoted. New Vote value: \(post.upvotes)")
    }
    
    public func decrementTotalVotes(post: Post) {
        let postRef = DBService.manager.getPosts().child(post.postID)
        let decrementVote = post.totalVotes  - 1
        let newDownvoteValue = post.downvotes - 1
        postRef.updateChildValues(["totalVotes": decrementVote] )
        postRef.updateChildValues(["downvotes": newDownvoteValue] )
    }
}

