//
//  Item.swift
//  Qreader
//
//  Copyright (c) 2015年 gomi. All rights reserved.
//

import Foundation

public class Item {
    
    public let id: String
    public let title: String
    public let user: User
    public let url: String
    public let renderedBody: String?
    public let body: String?
    public let coediting: Bool?
    public let createdAt: String?
    public let isPrivate: Bool?
    public let tags: [String]?
    public let updatedAt: String?
    
    public init(id: String, title: String, user: User, url: String,
        renderedBody: String?, body: String?, coediting: Bool?,
        createdAt: String?, isPrivate: Bool?, tags: [String]?, updatedAt: String?) {
        self.id = id
        self.title = title
        self.user = user
        self.url = url
        self.renderedBody = renderedBody
        self.body = body
        self.coediting = coediting
        self.createdAt = createdAt
        self.isPrivate = isPrivate
        self.tags = tags
        self.updatedAt = updatedAt
    }
    
}
