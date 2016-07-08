//
//  UserValidateInfoModel.swift
//  QuanZai
//
//  Created by i-chou on 7/8/16.
//  Copyright © 2016 i-chou. All rights reserved.
//

import ObjectMapper

class UserValidateInfoModel: BaseModel {
    
    var dirving_picture : String?
    var driving_license : String?
    var real_name : String?
    var status : String?
    var u_id : String?
    
    required init?(_ map: Map) {
        super.init(map)
    }
    
    override func mapping(map: Map) {
        super.mapping(map)
        
        dirving_picture <- map["dirving_picture"]
        driving_license <- map["driving_license"]
        real_name <- map["real_name"]
        status <- map["status"]
        u_id <- map["u_id"]
    }
}
