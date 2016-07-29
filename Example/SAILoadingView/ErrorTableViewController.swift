//
//  RetryTableViewController.swift
//  SAILoadingView
//
//  Created by Septiyan Andika on 7/30/16.
//  Copyright © 2016 CocoaPods. All rights reserved.
//

import UIKit
import SAILoadingView
class ErrorTableViewController: UITableViewController {
    var data_array:[String] = []
    var loadingView:SAILoadingView?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let reload = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Refresh, target: self, action: #selector(self.loadData))
        self.navigationItem.rightBarButtonItem = reload
        loadingView = SAILoadingView(parent: self.view)
        self.loadData()
    }
    
    func loadData(){
        self.data_array = []
        loadingView?.showLoading("Please Wait")
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, Int64(3 * Double(NSEC_PER_SEC))), dispatch_get_main_queue()) {
           self.tableView.reloadData()
            self.loadingView?.showError("Error Getting Data..")
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


