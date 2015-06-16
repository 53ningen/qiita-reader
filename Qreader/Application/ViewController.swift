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
    
    var pageMenu: CAPSPageMenu?
    let bundle: NSBundle = NSBundle.mainBundle()
    @IBOutlet weak var uiView: UIView!

    private static let TABLE_VIEW_ID = "ItemTableViewController"

    private let api: QiitaApi = QiitaApi(dataScheduler: MainScheduler.sharedInstance, urlSession: NSURLSession.sharedSession())
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        initPageMenu()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    private func initPageMenu() {
        // MARK: - UI Setup
        self.title = "Qiita Reader"
        self.navigationController?.navigationBar.barTintColor = UIColor(red: 30.0/255.0, green: 30.0/255.0, blue: 30.0/255.0, alpha: 1.0)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), forBarMetrics: UIBarMetrics.Default)
        self.navigationController?.navigationBar.barStyle = UIBarStyle.Black
        self.navigationController?.navigationBar.tintColor = UIColor.whiteColor()
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.orangeColor()]
        // MARK: - Scroll menu setup
        // Initialize view controllers to display and place in array
        let itemsController : ItemTableViewController = ItemTableViewController(nibName: ViewController.TABLE_VIEW_ID, bundle: bundle)
        itemsController.title = "ITEMS"
        let stocksController : ItemTableViewController = ItemTableViewController(nibName: ViewController.TABLE_VIEW_ID, bundle: bundle)
        stocksController.title = "STOCKS"
        let tagsController : ItemTableViewController = ItemTableViewController(nibName: ViewController.TABLE_VIEW_ID, bundle: bundle)
        tagsController.title = "TAGS"
        let controllerArray : [UIViewController] = [itemsController, stocksController, tagsController]
        // Customize menu (Optional)
        let parameters: [CAPSPageMenuOption] = [
            .ScrollMenuBackgroundColor(UIColor(red: 30.0/255.0, green: 30.0/255.0, blue: 30.0/255.0, alpha: 1.0)),
            .ViewBackgroundColor(UIColor(red: 20.0/255.0, green: 20.0/255.0, blue: 20.0/255.0, alpha: 1.0)),
            .SelectionIndicatorColor(UIColor.orangeColor()),
            .BottomMenuHairlineColor(UIColor(red: 70.0/255.0, green: 70.0/255.0, blue: 80.0/255.0, alpha: 1.0)),
            .MenuItemFont(UIFont(name: "HelveticaNeue", size: 13.0)!),
            .MenuHeight(40.0),
            .MenuItemWidth(90.0),
            .CenterMenuItems(true)
        ]
        // Initialize scroll menu
        pageMenu = CAPSPageMenu(viewControllers: controllerArray, frame: CGRectMake(0.0, 0.0, self.view.frame.width, self.view.frame.height), pageMenuOptions: parameters)
        self.uiView.addSubview(pageMenu!.view)
    }
}
