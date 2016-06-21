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
    case CategoryList()
    case TopicCreate(parameters:[String: AnyObject])
    case TopicList(maxId:Int,count:Int)
    case TopicDetail(topicId:Int)
    case CodeList(maxId:Int,count:Int)
    case CodeDetail(codeId:Int)
    case BookList(type:Int,maxId:Int,count:Int)
    case UserRegister(parameters:[String: AnyObject])
    case UserLogin(parameters:[String: AnyObject])
    case ArticleList(maxId:Int,count:Int)
    case ArticleDetail(articleId:Int)
    
    var method: Alamofire.Method {
        switch self {
        case .CategoryList:
            return .GET
        default:
            return .GET
        }
        
    }
    
    
    var path: String {
        switch self {
        case .CategoryList:
            return ServiceApi.getCategoryUrl()
        default :
            return ""
        }
    }
    
    
    var URLRequest: NSMutableURLRequest {
        let URL = NSURL(string: path)!
        let mutableURLRequest = NSMutableURLRequest(URL: URL)
        mutableURLRequest.HTTPMethod = method.rawValue
        
        if let token = Router.token {
            mutableURLRequest.setValue("\(token)", forHTTPHeaderField: "token")
        }
        
        mutableURLRequest.setValue("gzip,identity", forHTTPHeaderField: "Accept-Encoding")
        mutableURLRequest.setValue("application/vnd.zbcool.4+json", forHTTPHeaderField: "Accept")
        
        return mutableURLRequest
    }
}

