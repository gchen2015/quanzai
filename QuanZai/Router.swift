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
    case Login(phone : String, validateCode : String)
    case GetValidateCode(phone : String)
    case GetUserInfo(user_id : String)
    case GetCarInfo(car_id : String)
    case GetDateType(car_id : String)
    case SearchCar(lng : String, lat : String, type : String)
    case SerachNearStore(lng : String, lat : String, type : String)
    case EditUserInfo(user_id : String, phone : String, gender : String, head_portrait : String)
    case UploadPicture(type : String)
    case EditValidateInfo(user_id: String, real_name: String, driving_license: String, dirving_picture: String)
    
    var method: Alamofire.Method {
        switch self {
        case .Login,
             .EditUserInfo,
             .UploadPicture,
             .EditValidateInfo:
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
        case .GetValidateCode(let phone):
            return ServiceApi.GetValidateCodeUrl(phone)
        case .GetCarInfo(let car_id):
            return ServiceApi.GetCarInfoUrl(car_id)
        case .GetDateType(let car_id):
            return ServiceApi.GetDateTypeUrl(car_id)
        case .SearchCar(let lng, let lat, let type):
            return ServiceApi.SearchCarUrl(lng, lat: lat, type: type)
        case .SerachNearStore(let lng, let lat, let type):
            return ServiceApi.SerachNearStoreUrl(lng, lat: lat, type: type)
        case .EditUserInfo(let user_id, let phone, let gender, let head_portrait):
            return ServiceApi.EditUserInfoUrl(user_id, phone: phone, gender: gender, head_portrait: head_portrait)
        case .UploadPicture(let type):
            return ServiceApi.UploadPictureUrl(type)
        case .EditValidateInfo(let user_id, let real_name, let driving_license, let dirving_picture):
            return ServiceApi.EditValidateInfoUrl(user_id, real_name: real_name, driving_license: driving_license, dirving_picture: dirving_picture)
//        default :
//            return ServiceApi.host
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

