//
//  ItemViewController.swift
//  Qreader
//
//  Copyright (c) 2015 gomi. All rights reserved.
//

import UIKit

class ItemViewController: UIViewController {

    var item: Item?
    @IBOutlet weak var webView: UIWebView!
    @IBOutlet weak var itemTitleLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var navItem: UINavigationItem!
    @IBOutlet weak var itemTagLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        webView.loadHTMLString(self.item?.renderedBody, baseURL: NSURL(string: "http://qiita.com")!)
        itemTitleLabel.text = item?.title
        navItem.title = item?.title
        authorLabel.text = item?.user.id
    }

    func setItem(item: Item) {
        self.item = item
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
