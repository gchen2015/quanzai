//
//  CategoryModel.swift
//  QuanZai
//
//  Created by i-chou on 6/21/16.
//  Copyright © 2016 i-chou. All rights reserved.
//

import ObjectMapper

class CategoryModel: BaseModel {
    
    var item_id         : Int?
    var rel           : String?
    var href            : String?
    var links          : [LinkModel]?
    var name   : String?
    var backcolor    : String?
    
    required init?(_ map: Map) {
        super.init(map)
    }
    
    override func mapping(map: Map) {
        super.mapping(map)
        
        item_id <- map["id"]
        rel <- map["rel"]
        href <- map["href"]
        links <- map["links"]
        name <- map["name"]
        backcolor <- map["backcolor"]
    }
}
