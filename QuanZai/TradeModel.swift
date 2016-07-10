//
//  TradeModel.swift
//  QuanZai
//
//  Created by i-chou on 7/10/16.
//  Copyright © 2016 i-chou. All rights reserved.
//

import ObjectMapper

class TradeModel: BaseModel {
    
    var pay_fund_id : String?
    var pay_type : String?
    var trade_capital : String?
    var trade_explain : String?
    var trade_status : String?
    var trade_status_name : String?
    var trade_type : String?
    var trade_type_name : String?
    var u_id : String?
    
    required init?(_ map: Map) {
        super.init(map)
    }
    
    override func mapping(map: Map) {
        super.mapping(map)
        
        pay_fund_id <- map["pay_fund_id"]
        pay_type <- map["pay_type"]
        trade_capital <- map["trade_capital"]
        trade_explain <- map["trade_explain"]
        trade_status <- map["trade_status"]
        trade_status_name <- map["trade_status_name"]
        trade_type <- map["trade_type"]
        trade_type_name <- map["trade_type_name"]
        u_id <- map["u_id"]
    }
}
