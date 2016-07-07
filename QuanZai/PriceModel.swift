//
//  PriceModel.swift
//  QuanZai
//
//  Created by i-chou on 7/7/16.
//  Copyright © 2016 i-chou. All rights reserved.
//

import ObjectMapper

class PriceModel: BaseModel {
    
    var category_id : String?
    var date_type_id : String?
    var is_out_time : String?
    var mileage_unit_price : String?
    var time_unit_price : String?
    
    required init?(_ map: Map) {
        super.init(map)
    }
    
    override func mapping(map: Map) {
        super.mapping(map)
        
        category_id <- map["category_id"]
        date_type_id <- map["date_type_id"]
        is_out_time <- map["is_out_time"]
        mileage_unit_price <- map["mileage_unit_price"]
        time_unit_price <- map["time_unit_price"]
    }
}
