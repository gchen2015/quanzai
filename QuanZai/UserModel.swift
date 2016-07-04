//
//  UserModel.swift
//  QuanZai
//
//  Created by i-chou on 6/21/16.
//  Copyright © 2016 i-chou. All rights reserved.
//

import ObjectMapper

class UserModel: BaseModel {
    
    var phone           : String?
    var gender          : String?
    var head_portrait   : String?
    
    required init?(_ map: Map) {
        super.init(map)
    }
    
    override func mapping(map: Map) {
        super.mapping(map)
        
        phone <- map["phone"]
        gender <- map["gender"]
        head_portrait <- map["head_portrait"]
    }
}
