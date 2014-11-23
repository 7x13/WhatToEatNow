//
//  MyViewController.swift
//  WhatToEatNow
//
//  Created by 崔宇 on 14/11/22.
//  Copyright (c) 2014年 cuiyu. All rights reserved.
//

import UIKit

class MyViewController: UITableViewController {
    var userId: NSString!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "我做主的"
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return 3
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        if section == 0 {
            return 1
        } else if section == 1 {
            return 4
        } else {
            return 2
        }
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> MyViewCell {        // Configure the cell...
        var cell = loadMyViewCell()
        if indexPath.section == 0 {
            if (userId != nil) {
                cell.textLableForEachCell.text = userId
            } else {
                cell.textLableForEachCell.text = "点击登录"
            }
        } else if indexPath.section == 1 {
            switch indexPath.row {
            case 0:
                cell.textLableForEachCell.text = "我的菜谱"
            case 1:
                cell.textLableForEachCell.text = "我的收藏"
            case 2:
                cell.textLableForEachCell.text = "我的分享"
            case 3:
                cell.textLableForEachCell.text = "我的消息"
            default:
                cell.textLableForEachCell.text = nil
            }
        } else {
            switch indexPath.row {
            case 0:
                cell.textLableForEachCell.text = "系统设置"
            case 1:
                cell.textLableForEachCell.text = "意见反馈"
            default:
                cell.textLableForEachCell.text = nil
            }
        }
        return cell
    }

    // 载入xib中的TableViewCell
    func loadMyViewCell() -> MyViewCell {
        var cell: MyViewCell = MyViewCell()
        // 链接xib的方法
        var nib = NSBundle.mainBundle().loadNibNamed("MyViewCell", owner: self, options: nil)
        cell = nib.last as MyViewCell
        return cell
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
