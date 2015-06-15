//
//  ViewController.swift
//  Qreader
//
//  Copyright (c) 2015年 gomi. All rights reserved.
//

import RxSwift
import RxCocoa
import UIKit

class ViewController: UIViewController {
    
    private let api: QiitaApi = QiitaApi(dataScheduler: MainScheduler.sharedInstance, urlSession: NSURLSession.sharedSession())

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        api.getItems() >- subscribe(next: { println("success: \($0)")}, error: { "error: \($0)" }, completed: { println($0) })
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

