//
//  APIClient.swift
//  QuanZai
//
//  Created by i-chou on 6/17/16.
//  Copyright © 2016 i-chou. All rights reserved.
//

import Alamofire
import SwiftyJSON

class APIClient {
    
    func fetchData(url: String?) {
        Alamofire.request(.GET, "zbcool.com/article/posts/").responseJSON { response in
            switch response.result {
            case .Success:
                if let value = response.result.value {
                    let json = JSON(value)
                    if let number = json[0]["phones"][0]["number"].string {
                        // 找到电话号码
                        print("第一个联系人的第一个电话号码：",number)
                    }
                }
            case .Failure(let error):
                print(error)
            }
        }
    }
}