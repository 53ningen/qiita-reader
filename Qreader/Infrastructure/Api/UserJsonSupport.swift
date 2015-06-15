//
//  UserJsonSupport.swift
//  Qreader
//
//  Copyright (c) 2015年 gomi. All rights reserved.
//

import SwiftyJSON
import Foundation

public struct UserJsonSupport {
    
    static let DESCRIPTION: String = "description"
    static let FACEBOOK_ID: String = "facebook_id"
    static let FOLLOWEES_COUNT: String = "followees_count"
    static let FOLLOWERS_COUNT: String = "followers_count"
    static let GITHUB_LOGIN_NAME: String = "github_login_name"
    static let ID: String = "id"
    static let ITEMS_COUNT: String = "items_count"
    static let LINKEDIN_ID: String = "linkedin_id"
    static let LOCATION: String = "location"
    static let NAME: String = "name"
    static let ORGANIZATION: String = "organization"
    static let PERMANENT_ID: String = "permanent_id"
    static let PROFILE_IMAGE_URL: String = "profile_image_url"
    static let TWITTER_SCREEN_NAME: String = "twitter_screen_name"
    static let WEBSITE_URL: String = "website_url"
    
    public static func json2Users(json: JSON) -> [User]? {
        if let jsonArray = json.array {
            return jsonArray
                .map { UserJsonSupport.json2User($0) }
                .filter { $0 != nil }
                .map { $0! }
        } else {
            return nil
        }
    }

    public static func json2User(json: JSON) -> User? {
        let u = UserBuilder()
        u.description = json[DESCRIPTION].string
        u.facebookId = json[FACEBOOK_ID].string
        u.followeesCount = json[FOLLOWEES_COUNT].int
        u.followersCount = json[FOLLOWERS_COUNT].int
        u.githubLoginName = json[GITHUB_LOGIN_NAME].string
        u.id = json[ID].string
        u.itemsCount = json[ITEMS_COUNT].int
        u.linkedInId = json[LINKEDIN_ID].string
        u.location = json[LOCATION].string
        u.name = json[NAME].string
        u.organization = json[ORGANIZATION].string
        u.permanentId = json[PERMANENT_ID].int
        u.profileImageUrl = json[PROFILE_IMAGE_URL].string
        u.twitterScreenName = json[TWITTER_SCREEN_NAME].string
        u.websiteUrl = json[WEBSITE_URL].string
        return u.build()
    }

}
