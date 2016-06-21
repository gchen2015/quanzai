//
//  BaseModel.swift
//  QuanZai
//
//  Created by i-chou on 6/17/16.
//  Copyright © 2016 i-chou. All rights reserved.
//

import ObjectMapper

class BaseModel: Mappable {
    
    var id            : String?
    var ctime         : String?
    var utime         : String?
    
    required init?(_ map: Map){
        
    }
    
    func mapping(map: Map) {
        
        id <- map["id"]
        ctime <- map["ctime"]
        utime <- map["utime"]
    }
}