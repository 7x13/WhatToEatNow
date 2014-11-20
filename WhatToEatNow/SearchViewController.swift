//
//  SecondViewController.swift
//  WhatToEatNow
//
//  Created by 崔宇 on 14/10/17.
//  Copyright (c) 2014年 cuiyu. All rights reserved.
//

import UIKit

class SearchViewController: UITableViewController, UISearchBarDelegate, UISearchDisplayDelegate{
    
    var foods = [Food]()
    var filteredFood = [Food]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "Search"
        
        self.foods = [Food(category: "staple" , name: "rice"),
        Food(category: "staple", name: "steamed bread"),
        Food(category: "hot dish", name: "shredded potatoes"),
        Food(category: "hot dish", name: "eggplant")]
        self.tableView.reloadData()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if(tableView == self.searchDisplayController?.searchResultsTableView){
            return self.filteredFood.count
        } else {
            return self.foods.count
        }
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = self.tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as UITableViewCell
        // ?tableView是显示在界面上的，self.tableView是全部的
        
        var food : Food
        if(tableView == self.searchDisplayController?.searchResultsTableView){
            food = filteredFood[indexPath.row]
        } else {
            food = foods[indexPath.row]
        }
        
        cell.textLabel.text = food.name
        return cell
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
   
    func filterContentForSearchText(searchText:String,scope:String = "All"){
        // 闭包
        self.filteredFood = self.foods.filter({ (food : Food) -> Bool in
            let strMath = food.name.rangeOfString(searchText)
            let scopeMath = (scope == "All") || (food.category == scope)
            return scopeMath && strMath != nil
        })
    }
    
    /*输入搜索文本时调用*/
    func searchDisplayController(controller: UISearchDisplayController, shouldReloadTableForSearchString searchString: String!) -> Bool {
        let scopes = self.searchDisplayController!.searchBar.scopeButtonTitles as [String]
        let selectedScope = scopes[self.searchDisplayController!.searchBar.selectedScopeButtonIndex] as String
        
        self.filterContentForSearchText(searchString,scope: selectedScope)
        return true
    }
    
    /*选择不同分类时调用*/
    func searchDisplayController(controller: UISearchDisplayController, shouldReloadTableForSearchScope searchOption: Int) -> Bool {
        let allScope = self.searchDisplayController!.searchBar.scopeButtonTitles as [String]
        let selectedScop = allScope[searchOption] as String
        
        self.filterContentForSearchText(self.searchDisplayController!.searchBar.text,scope: selectedScop)
        return true
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        self.performSegueWithIdentifier("searchDetail", sender: tableView)
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if(segue.identifier == "searchDetail") {
            let detailViewController = segue.destinationViewController as UIViewController
            if(sender as UITableView == self.searchDisplayController!.searchResultsTableView){
                let indexPath = self.searchDisplayController!.searchResultsTableView.indexPathForSelectedRow()!
                let destinationTitle = self.filteredFood[indexPath.row].name
                
                detailViewController.title = destinationTitle

                
            }else {
                
                let indexPath = self.tableView.indexPathForSelectedRow()!
                let destinationTitle = self.foods[indexPath.row].name
                
                detailViewController.title = destinationTitle
            }
        }
    }
}



