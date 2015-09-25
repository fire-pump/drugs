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
                    class Repo {
                        
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
                   
                        
                    }
                }
            }        // Dispose of any resources that can be recreated.
        }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}