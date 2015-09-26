//
//  Drug.swift
//  drugs
//
//  Created by robert on 9/26/15.
//  Copyright (c) 2015 robert. All rights reserved.
//

import Foundation
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