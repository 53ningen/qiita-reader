//
//  User.swift
//  Qreader
//
//  Copyright (c) 2015年 gomi. All rights reserved.
//

import Foundation

public class User {
    
    public let description: String?
    public let facebookId: String?
    public let followeesCount: Int?
    public let followersCount: Int?
    public let githubLoginName: String?
    public let id: String
    public let itemsCount: Int?
    public let linkedInId: String?
    public let location: String?
    public let name: String
    public let organization: String?
    public let permanentId: CLong?
    public let profileImageUrl: String
    public let twitterScreenName: String?
    public let websiteUrl: String?
    
    public init(id: String, name: String, profileImageUrl: String,
        description: String?, facebookId: String?, followeesCount: Int?,
        followersCount: Int?, githubLoginName: String?, itemsCount: Int?,
        linkedInId: String?, location: String?, organization: String?,
        permanentId: CLong?, twitterScreenName: String?, websiteUrl: String?) {
        self.id = id
        self.name = name
        self.profileImageUrl = profileImageUrl
        self.description = description
        self.facebookId = facebookId
        self.followeesCount = followeesCount
        self.followersCount = followersCount
        self.githubLoginName = githubLoginName
        self.itemsCount = itemsCount
        self.linkedInId = linkedInId
        self.location = location
        self.organization = organization
        self.permanentId = permanentId
        self.twitterScreenName = twitterScreenName
        self.websiteUrl = websiteUrl
    }

}
