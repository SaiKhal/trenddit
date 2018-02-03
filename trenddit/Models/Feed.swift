//
//  Feed.swift
//  trenddit
//
//  Created by Clint M on 2/3/18.
//  Copyright © 2018 C4Q. All rights reserved.
//

import Foundation

//TODO: Implement a more solid Feed model

struct Feed: Codable {
    let userID: UserDetails
}

struct UserDetails: Codable  {
    let userName: String
    let profileImage: String
    let postID: PostDetails
}

struct PostDetails: Codable {
    var title: String
    var category: String
    var totalVotes: String
    var totalComments: Int
    var flagged: Bool
    var postImage: String
}
