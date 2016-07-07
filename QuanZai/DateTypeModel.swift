//
//  DateTypeModel.swift
//  QuanZai
//
//  Created by i-chou on 7/7/16.
//  Copyright © 2016 i-chou. All rights reserved.
//

import ObjectMapper

class DateTypeModel: BaseModel {
    
    var base_price_list : [PriceModel]?
    var date_type_name : String?
    var time_point : String?
    
    required init?(_ map: Map) {
        super.init(map)
    }
    
    override func mapping(map: Map) {
        super.mapping(map)
        
        base_price_list <- map["base_price_list"]
        date_type_name <- map["date_type_name"]
        time_point <- map["time_point"]
    }
}
