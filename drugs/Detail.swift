//
//  Detail.swift
//  drugs
//
//  Created by robert on 4/1/15.
//  Copyright (c) 2015 robert. All rights reserved.
//

import UIKit

class Detail: UIViewController {
    
    required init(coder aDecoder: NSCoder) {
        id = 0
        super.init(coder: aDecoder)
    }
    
    @IBOutlet weak var DInfo: UILabel!
    @IBOutlet weak var DI: UIImageView!
    @IBOutlet weak var Did: UILabel!
    var id: Int
    override func viewDidLoad() {
        super.viewDidLoad()
        let endpoint = NSURL(string: "http://jesuscodes.me/drugs/list.json")
        var data = NSData(contentsOfURL: endpoint!)
        if let json: NSDictionary = NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.MutableContainers, error: nil) as? NSDictionary {
            if let items = json["items"] as? NSArray {
                                for item in items {
                                    
                    }
                }
            }        // Dispose of any resources that can be recreated.
        }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}