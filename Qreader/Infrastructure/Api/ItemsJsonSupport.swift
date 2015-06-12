//
//  ItemsJsonSupport.swift
//  Qreader
//
//  Copyright (c) 2015年 gomi. All rights reserved.
//

import SwiftyJSON
import Foundation

public struct ItemsJsonSupport {
    
    static let RENDERED_BODY: String = "rendered_body"
    static let BODY: String = "body"
    static let COEDITING: String = "coediting"
    static let CREATED_AT: String = "created_at"
    static let ID: String = "id"
    static let PRIVATE: String = "private"
    static let TAGS: String = "tags"
    static let TITLE: String = "title"
    static let UPDATED_AT: String = "updated_at"
    static let URL: String = "url"
    static let USER: String = "user"
    
    public static func json2Items(json: JSON) -> [Item]? {
        if let jsonArray = json.array {
            return jsonArray
                .map { ItemsJsonSupport.json2Item($0) }
                .filter { $0 != nil }
                .map { $0! }
          }
        return nil
    }

    public static func json2Item(json: JSON) -> Item? {
        let i = ItemBuilder()
        i.renderedBody = json[RENDERED_BODY].string
        i.body = json[BODY].string
        i.coediting = json[COEDITING].bool
        i.createdAt = json[CREATED_AT].string
        i.id = json[ID].string
        i.isPrivate = json[PRIVATE].bool
        i.tags = json[TAGS].arrayObject as? [String]
        i.title = json[TITLE].string
        i.updatedAt = json[UPDATED_AT].string
        i.url = json[URL].string
        i.user = UserJsonSupport.json2User(json[USER])
        return i.build()
    }
    
}
