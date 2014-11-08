//
//  FirstViewController.swift
//  WhatToEatNow
//
//  Created by 崔宇 on 14/10/17.
//  Copyright (c) 2014年 cuiyu. All rights reserved.
//

import UIKit

class HomeViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationBar()
        // 解决StatusBar和程序页面重合的问题
        self.automaticallyAdjustsScrollViewInsets = false
        self.edgesForExtendedLayout = .None
        self.extendedLayoutIncludesOpaqueBars = false
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

   /**
    * 修改NavigationBar
    */
    func setNavigationBar() {
        self.navigationItem.title = "今日推荐"
        var item : UIBarButtonItem = UIBarButtonItem(title: "历史记录", style: .Plain, target: self, action: "editingMode:")
        self.navigationItem.rightBarButtonItem = item
    }

}