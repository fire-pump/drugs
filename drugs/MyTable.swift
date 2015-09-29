//
//  MyTable.swift
//  drugs
//
//  Created by robert on 4/1/15.
//  Copyright (c) 2015 robert. All rights reserved.
//

import UIKit


class MyTable: UITableViewController {
    
    var drugsList: [Drug] = [];
    override func viewDidLoad() {
        super.viewDidLoad()
        var i = 0
        let requestUrl = NSURL(string: "http://jesuscodes.me/drugs/list.json")
        print("Api request: url=\(requestUrl!)")
        let request = NSMutableURLRequest(URL: requestUrl!)
        
        let task = NSURLSession.sharedSession().dataTaskWithRequest(request){
            (data, response, error) in let data = NSData (contentsOfURL: requestUrl!)
            if let json: NSDictionary = NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.MutableContainers, error: nil) as? NSDictionary {
                if let items = json ["items"] as? NSArray {
                    for item in items {
                        
                        self.drugsList.append(Drug(json: item as NSDictionary))
                        
                        
                    }
                }
            }
            dispatch_async(dispatch_get_main_queue(), {
                () -> () in self.tableView.reloadData()
                
            })
        }
        
        task.resume()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        
        return drugsList.count
        
    }
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> DrugViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("MyCell") as DrugViewCell
        let drug = drugsList[indexPath.row]
        cell.cellName.text = "\(drug.name) #\(indexPath.item)"
        let img = NSURL( string : drug.cover!)
        let data = NSData(contentsOfURL: img!)
        cell.CellImage.image = UIImage (data: data!);
        return cell
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let vc = segue.destinationViewController as Detail
        let id = sender as Int
        vc.id = id
    }
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        performSegueWithIdentifier("ToDetail", sender: indexPath.item)    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        
        return 1
    }
}
