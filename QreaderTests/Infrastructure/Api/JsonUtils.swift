//
//  JsonUtils.swift
//  Qreader
//
//  Copyright (c) 2015年 gomi. All rights reserved.
//

import SwiftyJSON
import Foundation

func getJson(filename: String, type: String) -> JSON {
    let bundle = NSBundle(forClass: UserJsonSupportTest.classForCoder())
    let path: String = bundle.pathForResource(filename, ofType: type)!
    let data: NSData = NSData(contentsOfFile: path)!
    let d: NSData = NSString(data: data, encoding: NSUTF8StringEncoding)!.dataUsingEncoding(NSUTF8StringEncoding, allowLossyConversion: false)!
    return JSON(data: d)
}
