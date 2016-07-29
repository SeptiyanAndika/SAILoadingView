//
//  RetryTableViewController.swift
//  SAILoadingView
//
//  Created by Septiyan Andika on 7/30/16.
//  Copyright © 2016 CocoaPods. All rights reserved.
//

import UIKit
import SAILoadingView
class RetryTableViewController: UITableViewController {
    var data_array:[String] = []
    var loadingView:SAILoadingView?
    var retry:Bool = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let reload = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Refresh, target: self, action: #selector(self.loadData))
        self.navigationItem.rightBarButtonItem = reload
        loadingView = SAILoadingView(parent: self.view)
        loadingView?.onClickRetry = {
            
            self.loadData()
        }
        self.loadData()
       
    }
    
    func loadData(){
        self.data_array = []
        loadingView?.showLoading("Please Wait")
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, Int64(3 * Double(NSEC_PER_SEC))), dispatch_get_main_queue()) {
            if self.retry == true {
                self.loadingView?.showError("Error getting data, Please try again")
                 self.retry = false
            }else{
                self.data_array = ["iPhone 4s", "iPhone 5", "iPhone 5s", "iPhone 6", "iPhone 6 Plus", "iPhone 6s", "iPhone 6s Plus", "iPhone 7", "iPhone 7 Plus"]
                self.tableView.reloadData()
                self.loadingView?.dismissLoading()
                 self.retry = true
            }
        }
    }
    
   override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data_array.count
    }
    
   override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)
        cell.textLabel?.text = data_array[indexPath.row]
        return cell
    }
}


