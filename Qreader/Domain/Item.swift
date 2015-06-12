//
//  Item.swift
//  Qreader
//
//  Copyright (c) 2015年 gomi. All rights reserved.
//

import Foundation

public class Item {
    
    let renderedBody: String? = nil
    let body: String? = nil
    let coediting: Bool? = nil
    let createdAt: String? = nil
    let id: String
    let isPrivate: Bool? = nil
    let tags: [String]? = nil
    let title: String
    let updatedAt: String? = nil
    let url: String
    let user: User
    
    public init(id: String, title: String, user: User, url: String) {
        self.id = id
        self.title = title
        self.user = user
        self.url = url
    }
    
}
