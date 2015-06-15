//
//  QiitaApi.swift
//  Qreader
//
//  Copyright (c) 2015年 gomi. All rights reserved.
//


import RxSwift
import RxCocoa
import SwiftyJSON
import Foundation

public class QiitaApi {
    
    private let dataScheduler: ImmediateScheduler
    private let urlSession: NSURLSession
    
    private static let API_END_POINT: String = "http://qiita.com/api/v2/"
    private static let API_ITEMS: String = "items"
    private static let API_TAGS: String = "tags"
    private static let API_STOCKS: String = "stocks"

    public init(dataScheduler: ImmediateScheduler, urlSession: NSURLSession) {
        self.dataScheduler = dataScheduler
        self.urlSession = urlSession
    }
    
    func getItems() -> Observable<[Item]> {
        let url: NSURL! = NSURL(string: QiitaApi.API_END_POINT + QiitaApi.API_ITEMS)
        let request: NSURLRequest! = NSURLRequest(URL: url)
        return self.urlSession.rx_response(request)
            >- map { (maybeData: NSData?, maybeResponse: NSURLResponse?) in
                if let data = maybeData, let items = ItemJsonSupport.json2Items(JSON(data)) {
                    return items
                } else {
                    return []
                }
            }
            >- observeSingleOn(dataScheduler)
            >- catch { result in
                return returnElement([])
            }
    }
    
    func getTags() -> Observable<[Tag]> {
        let url: NSURL! = NSURL(string: QiitaApi.API_END_POINT + QiitaApi.API_TAGS)
        let request: NSURLRequest! = NSURLRequest(URL: url)
        return self.urlSession.rx_response(request)
            >- map { (maybeData: NSData?, maybeResponse: NSURLResponse?) in
                if let data = maybeData, let tags = TagJsonSupport.json2tags(JSON(data)) {
                    return tags
                } else {
                    return []
                }
            }
            >- observeSingleOn(dataScheduler)
            >- catch { result in
                return returnElement([])
        }
    }
    
}
