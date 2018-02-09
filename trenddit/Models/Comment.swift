//
//  Comment.swift
//  trenddit
//
//  Created by Masai Young on 2/8/18.
//  Copyright © 2018 C4Q. All rights reserved.
//

import Foundation

struct Comment: Codable {
    let userID: String
    let postID: String
    let date: String
    var commentText: String
    var creator: String
    var category: String
    
    init(commentDict: [String : Any]) {
        postID = commentDict["postID"] as? String ?? ""
        userID = commentDict["userID"] as? String ?? ""
        commentText = commentDict["commentText"] as? String ?? ""
        creator = commentDict["creator"] as? String ?? ""
        category = commentDict["category"] as? String ?? ""

        date = {
            let dateStr = commentDict["date"] as? String ?? ""
            return dateStr.components(separatedBy: CharacterSet.letters).reduce("", {$0 + $1 + " "})
        }()
    }
}
