//
//  CarModel.swift
//  QuanZai
//
//  Created by i-chou on 7/4/16.
//  Copyright © 2016 i-chou. All rights reserved.
//

import ObjectMapper

class CarModel: BaseModel {
    
    var name                : String?
    var car_licence_plates  : String?
    var vin_no              : String?
    
    var picture                : String?
    var battery_life                : String?
    var has_satnav_display                : String?
    var has_sunroof_display                : String?
    var has_sound_sys_display                : String?
    var has_reversing_adar_display                : String?
    var has_reversing_image_display                : String?
    var gearbox_type_display                : String?
    var engine_displacement                : String?
    
    var seats                : String?
    var car_boxs                : String?
    var car_category_name: String?
    var car_status_name                : String?
    var car_user_id                : String?
    var device_no                : String?
    
    var distance                : String?
    var is_online                : String?
    var is_online_display                : String?
    var last_charging_time                : String?
    var lat                : String?
    var lng                : String?
    var store_id                : String?
    var store_name                : String?
    
    required init?(_ map: Map) {
        super.init(map)
    }
    
    override func mapping(map: Map) {
        super.mapping(map)
        
        name <- map["name"]
        car_licence_plates <- map["car_licence_plates"]
        vin_no <- map["vin_no"]
        picture <- map["picture"]
        
        battery_life <- map["battery_life"]
        has_satnav_display <- map["has_satnav_display"]
        has_sunroof_display <- map["has_sunroof_display"]
        has_sound_sys_display <- map["has_sound_sys_display"]
        has_reversing_adar_display <- map["has_reversing_adar_display"]
        has_reversing_image_display <- map["has_reversing_image_display"]
        gearbox_type_display <- map["gearbox_type_display"]
        engine_displacement <- map["engine_displacement"]
        
        seats <- map["seats"]
        car_boxs <- map["car_boxs"]
        car_category_name <- map["car_category_name"]
        car_status_name <- map["car_status_name"]
        car_user_id <- map["car_user_id"]
        device_no <- map["device_no"]
        
        distance <- map["distance"]
        is_online <- map["is_online"]
        is_online_display <- map["is_online_display"]
        last_charging_time <- map["last_charging_time"]
        lat <- map["lat"]
        lng <- map["lng"]
        store_id <- map["store_id"]
        store_name <- map["store_name"]
    }
}