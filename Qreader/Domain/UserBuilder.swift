//
//  UserBuilder.swift
//  Qreader
//
//  Copyright (c) 2015年 gomi. All rights reserved.
//

import Foundation

public class UserBuilder {
    
    public var description: String?
    public var facebookId: String?
    public var followeesCount: Int?
    public var followersCount: Int?
    public var githubLoginName: String?
    public var id: String?
    public var itemsCount: Int?
    public var linkedInId: String?
    public var location: String?
    public var name: String?
    public var organization: String?
    public var permanentId: CLong?
    public var profileImageUrl: String?
    public var twitterScreenName: String?
    public var websiteUrl: String?

    public func build() -> User? {
        if let id = id, let name = name, profileImageUrl = profileImageUrl {
            return User(id: id, name: name, profileImageUrl: profileImageUrl,
                description: description, facebookId: facebookId, followeesCount: followeesCount,
                followersCount: followersCount, githubLoginName: githubLoginName,
                itemsCount: itemsCount, linkedInId: linkedInId, location: location,
                organization: organization, permanentId: permanentId,
                twitterScreenName: twitterScreenName, websiteUrl: websiteUrl)
        }
        return nil 
    }
    
}
