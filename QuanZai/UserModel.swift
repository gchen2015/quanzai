//
//  UserModel.swift
//  QuanZai
//
//  Created by i-chou on 6/21/16.
//  Copyright © 2016 i-chou. All rights reserved.
//

import ObjectMapper

class UserModel: BaseModel {
    
    var user_id         : String?
    var phone           : String?
    var name            : String?
    var gender          : String?
    var head_portrait   : String?
    var new_password    : String?
    var old_password    : String?
    
    required init?(_ map: Map) {
        super.init(map)
    }
    
    override func mapping(map: Map) {
        super.mapping(map)
        
        user_id <- map["user_id"]
        phone <- map["phone"]
        name <- map["name"]
        gender <- map["gender"]
        head_portrait <- map["head_portrait"]
        new_password <- map["new_password"]
        old_password <- map["old_password"]
    }
}
