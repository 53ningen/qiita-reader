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
    private static let API_USERS: String = "users"
    private static let API_STOCKS: String = "stocks"
    private static let API_AUTHENTICATED_USER: String = "authenticated_user"
    private static let ACCESS_TOKEN: String = "Bearer "

    public init(dataScheduler: ImmediateScheduler, urlSession: NSURLSession) {
        self.dataScheduler = dataScheduler
        self.urlSession = urlSession
    }
    
    public func getItems() -> Observable<[Item]> {
        return getItems("")
    }
    
    public func getItems(query: String) -> Observable<[Item]> {
        let url: NSURL! = NSURL(string: QiitaApi.API_END_POINT + QiitaApi.API_ITEMS)
        let requestBuilder = NSMutableURLRequest(URL: url)
        requestBuilder.addValue(QiitaApi.ACCESS_TOKEN, forHTTPHeaderField: "Authorization")
        return self.urlSession.rx_response(requestBuilder)
            >- map { (maybeData: NSData?, maybeResponse: NSURLResponse?) in
                if let json = self.getJson(maybeData), let items = ItemJsonSupport.json2Items(json) {
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
    
    public func getTags() -> Observable<[Tag]> {
        let url: NSURL! = NSURL(string: QiitaApi.API_END_POINT + QiitaApi.API_TAGS)
        let request: NSURLRequest! = NSURLRequest(URL: url)
        return self.urlSession.rx_response(request)
            >- map { (maybeData: NSData?, maybeResponse: NSURLResponse?) in
                if let json = self.getJson(maybeData), let tags = TagJsonSupport.json2tags(json) {
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
    
    public func getStocks(userId: String) -> Observable<[Item]> {
        let url: NSURL! = NSURL(string: QiitaApi.API_END_POINT + QiitaApi.API_USERS + "/" + userId + "/" + QiitaApi.API_STOCKS)
        let request: NSURLRequest! = NSURLRequest(URL: url)
        return self.urlSession.rx_response(request)
            >- map { (maybeData: NSData?, maybeResponse: NSURLResponse?) in
                if let json = self.getJson(maybeData), let items = ItemJsonSupport.json2Items(json) {
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
    
    public func getAuthenticatedUser() -> Observable<User?> {
        let url: NSURL! = NSURL(string: QiitaApi.API_END_POINT + QiitaApi.API_AUTHENTICATED_USER)
        let requestBuilder = NSMutableURLRequest(URL: url)
        requestBuilder.addValue(QiitaApi.ACCESS_TOKEN, forHTTPHeaderField: "Authorization")
        return self.urlSession.rx_response(requestBuilder)
            >- map { (maybeData: NSData?, maybeResponse: NSURLResponse?) in
                if let json = self.getJson(maybeData), let user = UserJsonSupport.json2User(json) {
                    return user
                } else {
                    return nil
                }
            }
            >- observeSingleOn(dataScheduler)
            >- catch { result in
                return returnElement(nil)
        }
    }
    
    private func getJson(data: NSData?) -> JSON? {
        if let d1 = data,
            let str = NSString(data: d1, encoding: NSUTF8StringEncoding),
            let d2 = str.dataUsingEncoding(NSUTF8StringEncoding, allowLossyConversion: false) {
                return JSON(data: d2)
        } else {
            return nil
        }
    }
    
}
