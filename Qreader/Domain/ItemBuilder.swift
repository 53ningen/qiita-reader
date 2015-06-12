//
//  ItemBuilder.swift
//  Qreader
//
//  Copyright (c) 2015年 gomi. All rights reserved.
//

import Foundation

public class ItemBuilder {
    
    public var id: String?
    public var title: String?
    public var user: User?
    public var url: String?
    public var renderedBody: String?
    public var body: String?
    public var coediting: Bool?
    public var createdAt: String?
    public var isPrivate: Bool?
    public var tags: [String]?
    public var updatedAt: String?

    public func build() -> Item? {
        if let id = id, let title = title, let user = user, let url = url {
            return Item(id: id, title: title, user: user, url: url,
                renderedBody: renderedBody, body: body,
                coediting: coediting, createdAt: createdAt,
                isPrivate: isPrivate, tags: tags, updatedAt: updatedAt)
        }
        return nil
    }
    
}
