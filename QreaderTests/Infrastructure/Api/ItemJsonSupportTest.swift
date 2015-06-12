//
//  ItemJsonSupportTest.swift
//  Qreader
//
//  Copyright (c) 2015年 gomi. All rights reserved.
//

import UIKit
import Qreader
import XCTest

class ItemJsonSupportTest: XCTestCase {

    func testConvertJson2Item() {
        let item = ItemJsonSupport.json2Item(getJson("item", "json"))!
        XCTAssertEqual(item.user.id, "yaotti", "item")
        XCTAssertEqual(item.user.name, "Hiroshige Umino", "item")
        XCTAssertEqual(item.user.itemsCount!, 300, "item")
    }
    
    func testConvertJson2Items() {
        let items = ItemJsonSupport.json2Items(getJson("items", "json"))!
        XCTAssertEqual(items.count, 2, "items")
        XCTAssertEqual(items[1].user.id, "yaotti2", "items")
    }

}
