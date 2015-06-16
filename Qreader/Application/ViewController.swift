//
//  ViewController.swift
//  Qreader
//
//  Copyright (c) 2015年 gomi. All rights reserved.
//

import RxSwift
import RxCocoa
import UIKit
import PageMenu

class ViewController: UIViewController, CAPSPageMenuDelegate {
    
    let bundle: NSBundle = NSBundle.mainBundle()
    var pageMenu: CAPSPageMenu?

    private let api: QiitaApi = QiitaApi(dataScheduler: MainScheduler.sharedInstance, urlSession: NSURLSession.sharedSession())

    override func viewDidLoad() {
        super.viewDidLoad()
        initPageMenuView()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    private func initPageMenuView() {
        let itemsPageMenu: UIViewController = UIViewController(nibName: "ItemsPageMenuViewController", bundle: bundle)
        itemsPageMenu.title = "items"
        let stocksPageManu: UIViewController = UIViewController(nibName: "StocksPageMenuViewController", bundle: bundle)
        stocksPageManu.title = "stocks"
        let controllerArray: [UIViewController] = [itemsPageMenu, stocksPageManu]
        let parameters: [CAPSPageMenuOption] = [
            .MenuItemSeparatorWidth(4.3),
            .UseMenuLikeSegmentedControl(true),
            .MenuItemSeparatorPercentageHeight(0.1)
        ]
        pageMenu = CAPSPageMenu(viewControllers: controllerArray, frame: CGRectMake(0.0, 0.0, self.view.frame.width, self.view.frame.height), pageMenuOptions: parameters)
        self.view.addSubview(pageMenu!.view)
        pageMenu!.delegate = self
    }
    
}
