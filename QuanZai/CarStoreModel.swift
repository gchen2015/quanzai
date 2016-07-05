//
//  CarStoreModel.swift
//  QuanZai
//
//  Created by i-chou on 7/5/16.
//  Copyright © 2016 i-chou. All rights reserved.
//

import ObjectMapper

class CarStoreModel: BaseModel {
        
        var name : String?
        var address : String?
        var charging_pile_cnt : String?
        var distance : String?
        var lat : String?
        var lng : String?
        var is_open : String?
        var listStore_login : String?
        var park_place_cnt : String?
        var radius : String?
        
        required init?(_ map: Map) {
            super.init(map)
        }
        
        override func mapping(map: Map) {
            super.mapping(map)
            
            name <- map["name"]
            address <- map["address"]
            charging_pile_cnt <- map["charging_pile_cnt"]
            distance <- map["distance"]
            lat <- map["lat"]
            lng <- map["lng"]
            is_open <- map["is_open"]
            listStore_login <- map["listStore_login"]
            park_place_cnt <- map["park_place_cnt"]
            radius <- map["radius"]
        }
}