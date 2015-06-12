//
//  Item.swift
//  Qreader
//
//  Copyright (c) 2015年 gomi. All rights reserved.
//

import Foundation

public class Item {
    
    let id: String
    let title: String
    let user: User
    let url: String
    let renderedBody: String?
    let body: String?
    let coediting: Bool?
    let createdAt: String?
    let isPrivate: Bool?
    let tags: [String]?
    let updatedAt: String?
    
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
