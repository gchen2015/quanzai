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
//    var gender_display  : String?
    var head_portrait   : String?
    var token           : String?
    
    required init?(_ map: Map) {
        super.init(map)
    }
    
    override func mapping(map: Map) {
        super.mapping(map)
        
        phone <- map["phone"]
        gender <- map["gender"]
        head_portrait <- map["head_portrait"]
        token <- map["token"]
    }
}

extension UserModel {
    
    func gender_display() -> String {
        if self.gender != nil {
            if self.gender == "1" {
                return "男"
            } else if self.gender == "2" {
                return "女"
            } else {
                return ""
            }
        }
        return ""
    }
}