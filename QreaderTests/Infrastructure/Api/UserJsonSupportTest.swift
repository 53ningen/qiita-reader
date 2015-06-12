//
//  UserJsonSupportTest.swift
//  Qreader
//
//  Copyright (c) 2015年 gomi. All rights reserved.
//

import SwiftyJSON
import Qreader
import XCTest

class UserJsonSupportTest: XCTestCase {
    
    func testConvertJson2User() {
        let user = UserJsonSupport.json2User(getJson("user", "json"))
        XCTAssertEqual(user!.id, "yaotti", "user")
        XCTAssertEqual(user!.name, "Hiroshige Umino", "user")
        XCTAssertEqual(user!.itemsCount!, 300, "user")
    }

    func testConvertJson2Users() {
        let users = UserJsonSupport.json2Users(getJson("users", "json"))
        XCTAssertEqual(users!.count, 2, "users")
        XCTAssertEqual(users![1].id, "yaotti2", "users")
    }

}

