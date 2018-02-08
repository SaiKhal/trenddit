//
//  User.swift
//  trenddit
//
//  Created by Masai Young on 2/7/18.
//  Copyright © 2018 C4Q. All rights reserved.
//

import Foundation

struct Profile: Codable {
    let userID: String
    var diplayName: String
    var email: String
    var upvotes: Int?
    var downvotes: Int?
    var numberOfComments: Int?
    var image: String?
    var posts: [String]?
    func toJSON() -> Any {
        let jsonData = try! JSONEncoder().encode(self)
        return try! JSONSerialization.jsonObject(with: jsonData, options: [])
    }
    
    init(postDict: [String : Any]) {
        userID = postDict["userID"] as? String ?? ""
        diplayName = postDict["diplayName"] as? String ?? ""
        email = postDict["email"] as? String ?? ""
        image = postDict["image"] as? String ?? ""
        upvotes = postDict["upvotes"] as? Int ?? 0
        downvotes = postDict["downvotes"] as? Int ?? 0
        numberOfComments = postDict["numberOfComments"] as? Int ?? 0
    }
}

