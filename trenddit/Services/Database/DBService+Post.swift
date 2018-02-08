//
//  DBService+Post.swift
//  trenddit
//
//  Created by Masai Young on 2/7/18.
//  Copyright © 2018 C4Q. All rights reserved.
//

import Foundation
import UIKit

extension DBService {
    public func addPost(title: String, category: String, image: UIImage) {
        let childByAutoId = DBService.manager.getPosts().childByAutoId()
        let dateCreated = ISO8601DateFormatter().string(from: Date())
        guard let userId = AuthClient.currentUser?.uid else { fatalError("uid is nil")}
        guard let displayName = AuthClient.currentUser?.displayName else { fatalError("displayName is nil") }
        
        childByAutoId.setValue(["postID"         : childByAutoId.key,
                                "userId"        : userId,
                                "title"         : title,
                                "creator"       : displayName,
                                "category"      : category,
                                "upvotes"       : 0,
                                "downvotes"     : 0,
                                "totalVotes"    : 0,
                                "flagged"       : false,
                                "imageUrl"      : ""]) { (error, dbRef) in
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
}

