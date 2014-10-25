//
//  FirstViewController.swift
//  WhatToEatNow
//
//  Created by 崔宇 on 14/10/17.
//  Copyright (c) 2014年 cuiyu. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // 解决StatusBar和程序页面重合的问题
        self.automaticallyAdjustsScrollViewInsets = false
        setNavigationBar()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

   /**
    * 添加NavigationBar
    */
    func setNavigationBar() {
        var screenRect:CGRect = self.view.bounds
        var navBar:UINavigationBar = UINavigationBar(frame: CGRectMake(0, 20, screenRect.size.width, 44))
        var navItem:UINavigationItem = UINavigationItem(title: "Home")
        navBar.pushNavigationItem(navItem, animated: true)
        self.view.addSubview(navBar)
        var item : UIBarButtonItem = UIBarButtonItem(barButtonSystemItem: .Reply, target: self, action: "navigationBackButton:")
        navItem.leftBarButtonItem = item
        navBar.setItems(NSArray(object: navItem), animated: true)
    }

}