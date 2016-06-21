//
//  LinkModel.swift
//  QuanZai
//
//  Created by i-chou on 6/21/16.
//  Copyright © 2016 i-chou. All rights reserved.
//

import ObjectMapper

class LinkModel: BaseModel {
    
    var method         : String?
    var rel           : String?
    var href            : String?
    var name   : String?
    var accept    : String?
    var data : [LinkDataModel]?
    
    
    
    required init?(_ map: Map) {
        super.init(map)
    }
    
    override func mapping(map: Map) {
        super.mapping(map)
        
        method <- map["method"]
        rel <- map["rel"]
        href <- map["href"]
        name <- map["name"]
        accept <- map["accept"]
        data <- map["data"]
    }
}
