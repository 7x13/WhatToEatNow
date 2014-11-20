//
//  HomeViewController.swift
//  WhatToEatNow
//
//  Created by 崔宇 on 14/11/15.
//  Copyright (c) 2014年 cuiyu. All rights reserved.
//

import Foundation
import UIKit


class HomeViewController: UITableViewController {
    var foods = [Food]()
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationBar()
        
        self.foods = [Food(category: "staple" , name: "rice"),
            Food(category: "staple", name: "steamed bread"),
            Food(category: "hot dish", name: "shredded potatoes"),
            Food(category: "hot dish", name: "eggplant")]
        //Do any additional setup after loading the view, typically from a nib.
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
        var item : UIBarButtonItem = UIBarButtonItem(title: "历史记录", style: .Plain, target: self, action: "historyMode:")
        self.navigationItem.rightBarButtonItem = item
    }
    
    func historyMode(button: UIBarButtonItem) {
        var con:(HistoryViewController) = HistoryViewController()
        con.title = ""
        // 设置下一级菜单的导航控制栏的左边返回按钮
        self.navigationController?.pushViewController(con, animated: true)
    }
    
    // MARK: - Table view data source
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        return self.foods.count
    }
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as UITableViewCell
        var title = foods[indexPath.row].name
        cell.textLabel.text = title
    
    // Configure the cell...
    
    return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        self.performSegueWithIdentifier("homeDetail", sender: tableView)
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if(segue.identifier == "homeDetail") {
            
            let detailViewController = segue.destinationViewController as UIViewController
            let indexPath = self.tableView.indexPathForSelectedRow()!
            let destinationTitle = self.foods[indexPath.row].name
            println(destinationTitle)
            
            detailViewController.title = destinationTitle
        }
    }
    
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
    // Return NO if you do not want the specified item to be editable.
    return true
    }
    */
    
    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
    if editingStyle == .Delete {
    // Delete the row from the data source
    tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
    } else if editingStyle == .Insert {
    // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }
    }
    */
    
    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {
    
    }
    */
    
    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
    // Return NO if you do not want the item to be re-orderable.
    return true
    }
    */
    
    /*
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    }
    */
}

