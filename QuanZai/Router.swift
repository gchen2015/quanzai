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
    case SerachNearStore(lng:String, lat:String, type:String)
    case EditUserInfo(user_id:String, phone:String, gender:String, head_portrait:String)
    case UploadPicture(type:String)
    
    var method: Alamofire.Method {
        switch self {
        case .Login,
             .EditUserInfo,
             .UploadPicture:
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
        case .SerachNearStore(let lng, let lat, let type):
            return ServiceApi.SerachNearStoreUrl(lng, lat: lat, type: type)
        case .EditUserInfo(let user_id, let phone, let gender, let head_portrait):
            let path = ServiceApi.EditUserInfoUrl(user_id, phone: phone, gender: gender, head_portrait: head_portrait)
            return path.stringByAddingPercentEncodingWithAllowedCharacters(NSCharacterSet.URLQueryAllowedCharacterSet())!
        case .UploadPicture(let type):
            return ServiceApi.UploadPicture(type)
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
        
        switch self {
//        case .UploadPicture(_):
//            mutableURLRequest.setValue("MultipartFile", forHTTPHeaderField: "Content-Type")
//            return mutableURLRequest
        default:
            return mutableURLRequest
        }
        
        
    }
}

