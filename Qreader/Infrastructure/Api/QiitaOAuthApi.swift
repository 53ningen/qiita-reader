//
//  QiitaOAuthApi.swift
//  Qreader
//
//  Copyright (c) 2015年 gomi. All rights reserved.
//

import RxSwift
import RxCocoa
import Foundation

public class QiitaOAuthApi {
    
    private let dataScheduler: ImmediateScheduler
    private let urlSession: NSURLSession
    
    public init(dataScheduler: ImmediateScheduler, urlSession: NSURLSession) {
        self.dataScheduler = dataScheduler
        self.urlSession = urlSession
    }
    
    private static let PARAM_CLIENT_ID: String = "client_id"
    private static let PARAM_CLIENT_SECRET: String = "client_secret"
    private static let PARAM_CODE: String = "code"
    private static let PARAM_SCOPE: String = "scope"

    private static let API_END_POINT: String = "http://qiita.com/api/v2/"
    private static let API_AUTHORIZE: String = "oauth/authorize"
    private static let API_ACCESS_TOKEN: String = "access_tokens"
    
    public func getAccessToken() -> Observable<String> {
        let url: NSURL! = NSURL(string: QiitaOAuthApi.API_END_POINT + QiitaOAuthApi.API_AUTHORIZE)
        let request: NSURLRequest! = NSURLRequest(URL: url)
        return returnElement("") // TODO
    }
    
}
