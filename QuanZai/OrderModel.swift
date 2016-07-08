//
//  OrderModel.swift
//  QuanZai
//
//  Created by i-chou on 7/8/16.
//  Copyright © 2016 i-chou. All rights reserved.
//

import ObjectMapper

class OrderModel : BaseModel {
    
    var address : String?
    var advance_payment_bond : String?
    var car_id : String?
    var car_licence_plates : String?
    
    var car_name : String?
    var car_type_id : String?
    var car_type_name : String?
    var date_time_id : String?
    var date_time_name : String?
    
    var from_store_id : String?
    var get_use_right : String?
    var get_use_right_display : String?
    
    var mileage_end : String?
    var mileage_start : String?
    var mileage_total : String?
    var operator_id : String?
    var operator_name : String?
    var operator_status : String?
    
    var operator_status_display : String?
    var operator_time : String?
    var order_amount : String?
    var order_creat_time : String?
    var order_status : String?
    var order_status_display : String?
    var payment_status : String?
    var payment_status_display : String?
    
    var payment_time : String?
    var phone : String?
    var real_end_time : String?
    var real_start_time : String?
    var reservation_end_time : String?
    var reservation_start_time : String?
    
    var store_id : String?
    var to_store_id : String?
    var u_id : String?
    var validate_car_status : String?
    var validate_car_status_display : String?
    
    required init?(_ map: Map) {
        super.init(map)
    }
    
    override func mapping(map: Map) {
        super.mapping(map)
        
        address <- map["address"]
        advance_payment_bond <- map["advance_payment_bond"]
        car_id <- map["car_id"]
        car_licence_plates <- map["car_licence_plates"]
        
        car_name <- map["car_name"]
        car_type_id <- map["car_type_id"]
        car_type_name <- map["car_type_name"]
        date_time_id <- map["date_time_id"]
        date_time_name <- map["date_time_name"]
        
        from_store_id <- map["from_store_id"]
        get_use_right <- map["get_use_right"]
        get_use_right_display <- map["get_use_right_display"]
        
        mileage_end <- map["mileage_end"]
        mileage_start <- map["mileage_start"]
        mileage_total <- map["mileage_total"]
        operator_id <- map["operator_id"]
        operator_name <- map["operator_name"]
        operator_status <- map["operator_status"]
        
        operator_status_display <- map["operator_status_display"]
        operator_time <- map["operator_time"]
        order_amount <- map["order_amount"]
        order_creat_time <- map["order_creat_time"]
        order_status <- map["order_status"]
        order_status_display <- map["order_status_display"]
        payment_status <- map["payment_status"]
        payment_status_display <- map["payment_status_display"]
        
        payment_time <- map["payment_time"]
        phone <- map["phone"]
        real_end_time <- map["real_end_time"]
        real_start_time <- map["real_start_time"]
        reservation_end_time <- map["reservation_end_time"]
        reservation_start_time <- map["reservation_start_time"]
        
        store_id <- map["store_id"]
        to_store_id <- map["to_store_id"]
        u_id <- map["u_id"]
        validate_car_status <- map["validate_car_status"]
        validate_car_status_display <- map["validate_car_status_display"]
    }
}
