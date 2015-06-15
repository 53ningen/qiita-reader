//
//  TagJsonSupport.swift
//  Qreader
//
//  Copyright (c) 2015年 gomi. All rights reserved.
//

import SwiftyJSON
import Foundation

public struct TagJsonSupport {
    
    private init() {}
    
    static let FOLLOWERS_COUNT: String = "followers_count"
    static let ICON_URL: String = "icon_url"
    static let ID: String = "id"
    static let ITEMS_COUNT: String = "items_count"
    
    public static func json2tags(json: JSON) -> [Tag]? {
        if let jsonArray = json.array {
            return jsonArray
                .map { TagJsonSupport.json2tag($0) }
                .filter { $0 != nil }
                .map { $0! }
         }
        return nil
    }
    
    public static func json2tag(json: JSON) -> Tag? {
        if let followersCount = json[FOLLOWERS_COUNT].int,
            let iconUrl = json[ICON_URL].string,
            let id = json[ID].string,
            let itemsCount = json[ITEMS_COUNT].int {
                return Tag(id: id, iconUrl: iconUrl, followersCount: followersCount, itemsCount: itemsCount)
        }
        return nil
    }
    
}
