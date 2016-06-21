//
//  LinkDataModel.swift
//  QuanZai
//
//  Created by i-chou on 6/21/16.
//  Copyright © 2016 i-chou. All rights reserved.
//

import ObjectMapper

class LinkDataModel: BaseModel {
    
    var countNum            : Int?
    var name   : String?
    var value    : String?
    var required : String?
    
    required init?(_ map: Map) {
        super.init(map)
    }
    
    override func mapping(map: Map) {
        super.mapping(map)
        
        countNum <- map["count"]
        name <- map["name"]
        value <- map["value"]
        required <- map["required"]
    }
}

