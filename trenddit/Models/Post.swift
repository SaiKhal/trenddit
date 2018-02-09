//
//  Post.swift
//  trenddit
//
//  Created by Masai Young on 1/30/18.
//  Copyright © 2018 C4Q. All rights reserved.
//

import Foundation

struct Post: Codable {
    let postID: String
    let userID: String
    let creator: String
    let date: String
    let userPhotoURL: String
    var title: String
    var upvotes: Int
    var downvotes: Int
    var totalVotes: Int
    var category: [String]
    var url: String?
    var image: String?
    var comments: [String]?
    func postToJSON()->Any{
        let jsonData = try! JSONEncoder().encode(self)
        return try! JSONSerialization.jsonObject(with: jsonData, options: [])
    }
    
    init(postDict: [String : Any]) {
        postID = postDict["postID"] as? String ?? ""
        userID = postDict["userID"] as? String ?? ""
        date = postDict["date"] as? String ?? ""
        userPhotoURL = postDict["userPhotoUrl"] as? String ?? ""
        creator = postDict["creator"] as? String ?? ""
        title = postDict["title"] as? String ?? ""
        image = postDict["imageURL"] as? String ?? ""
        upvotes = postDict["upvotes"] as? Int ?? 0
        downvotes = postDict["downvotes"] as? Int ?? 0
        totalVotes = postDict["totalVotes"] as? Int ?? 0
        category = postDict["category"] as? [String] ?? ["None"]
    }
}
