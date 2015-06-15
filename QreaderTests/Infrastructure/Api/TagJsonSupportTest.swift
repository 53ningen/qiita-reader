//
//  TagJsonSupportTest.swift
//  Qreader
//
//  Copyright (c) 2015年 gomi. All rights reserved.
//

import Qreader
import XCTest

class TagJsonSupportTest: XCTestCase {
    
    func testConvertJson2User() {
        let tag = TagJsonSupport.json2tag(getJson("tag", "json"))
        XCTAssertEqual(tag!.id, "qiita", "tag")
        XCTAssertEqual(tag!.itemsCount, 200, "tag")
        XCTAssertEqual(tag!.iconUrl!, "https://s3-ap-northeast-1.amazonaws.com/qiita-tag-image/9de6a11d330f5694820082438f88ccf4a1b289b2/medium.jpg", "tag")
        XCTAssertEqual(tag!.followersCount, 100, "tag")
    }
    
    func testConvertJson2Users() {
        let tags = TagJsonSupport.json2tags(getJson("tags", "json"))
        XCTAssertEqual(tags!.count, 2, "tags")
        XCTAssertEqual(tags![0].id, "qiita", "tag")
        XCTAssertEqual(tags![0].itemsCount, 200, "tag")
        XCTAssertEqual(tags![0].iconUrl!, "https://s3-ap-northeast-1.amazonaws.com/qiita-tag-image/9de6a11d330f5694820082438f88ccf4a1b289b2/medium.jpg", "tag")
        XCTAssertEqual(tags![0].followersCount, 100, "tag")
        XCTAssertEqual(tags![1].id, "gochiusa", "tag")
        XCTAssertEqual(tags![1].itemsCount, 9999999, "tag")
        XCTAssertEqual(tags![1].iconUrl!, "https://s3-ap-northeast-1.amazonaws.com/qiita-tag-image/9de6a11d330f5694820082438f88ccf4a1b289b2/medium.jpg", "tag")
        XCTAssertEqual(tags![1].followersCount, 12470, "tag")
    }

}
