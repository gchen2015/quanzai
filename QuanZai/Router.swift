//
//  Router.swift
//  QuanZai
//
//  Created by i-chou on 6/21/16.
//  Copyright © 2016 i-chou. All rights reserved.
//

import Alamofire

enum Router: URLRequestConvertible {
    
    static var token: String?
    
    //Restfull api
    case Login(phone:String, validateCode:String)
    case GetUserInfo(user_id:String)
    case GetDateType(car_id:Int)
    case SearchCar(lng:String, lat:String, type:String)

    
    var method: Alamofire.Method {
        switch self {
        case .Login:
            return .POST
        default:
            return .GET
        }
        
    }
    
    
    var path: String {
        switch self {
        case .GetUserInfo(let user_id):
            return ServiceApi.getUserInfoUrl(user_id)
        case .Login(let phone, let validateCode):
            return ServiceApi.loginUrl(phone, validateCode: validateCode)
        case .GetDateType(let car_id):
            return ServiceApi.GetDateTypeUrl(car_id)
        case .SearchCar(let lng, let lat, let type):
            return ServiceApi.SearchCarUrl(lng, lat: lat, type: type)
        default :
            return ServiceApi.host
        }
    }
    
    
    var URLRequest: NSMutableURLRequest {
        let URL = NSURL(string: path)!
        let mutableURLRequest = NSMutableURLRequest(URL: URL)
        mutableURLRequest.HTTPMethod = method.rawValue
        
//        if let token = Router.token {
//            mutableURLRequest.setValue("\(token)", forHTTPHeaderField: "token")
//        }
//        mutableURLRequest.setValue("application/vnd.zbcool.4+json", forHTTPHeaderField: "Accept")
        
        switch self {
//        case .Login(let parameters):
//            print(mutableURLRequest)
//            return Alamofire.ParameterEncoding.JSON.encode(mutableURLRequest, parameters: parameters).0
        default:
            return mutableURLRequest
        }
        
        
    }
}

