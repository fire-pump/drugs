//
//  MyTable.swift
//  drugs
//
//  Created by robert on 4/1/15.
//  Copyright (c) 2015 robert. All rights reserved.
//

import UIKit


class MyTable: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        class Drug {
            
            var idi : Int?
            var name: String?
            var description: String?
            var usage: String?
            var affect: String?
            var cautions : String?
            var addiction: Int?
            var price : Int?
            var cover : String?
            
            init(json: NSDictionary) {
                if let i = json["id"] as? Int {
                    self.idi = i
                }
                if let n = json["name"] as? String {
                    self.name = n
                }
                if let d = json["description"] as? String {
                    self.description = d
                }
                if let u = json["usage"] as? String {
                    self.usage = u
                }
                if let a = json["affect"] as? String {
                    self.affect = a
                }
                if let c = json["cautions"] as? String {
                    self.cautions = c
                }
                if let ad = json["addiction"] as? Int {
                    self.addiction = ad
                }
                if let p = json["price"] as? Int {
                    self.price = p
                }
                if let url = json["cover"] as? String {
                    self.cover = url
                }
            }
        }
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 1000
    }
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("MyCell") as UITableViewCell
        cell.textLabel?.text = "Drug #\(indexPath.item)"
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
