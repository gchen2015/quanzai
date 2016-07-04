//
//  ServiceAPI.swift
//  QuanZai
//
//  Created by i-chou on 6/21/16.
//  Copyright © 2016 i-chou. All rights reserved.
//

class ServiceApi: NSObject {
    
    static var host : String = "http://123.185.175.210:8081/RentCarManage"
    
    //获取用户信息
    internal class func getUserInfoUrl(user_id:Int) -> String {
        
        return "\(host)/User/Api/GetUserInfo.action?user_id=\(user_id)"
    }
    
    //登录
    internal class func loginUrl(phone:String, validateCode:String) -> String {
        
        return "\(host)/User/Api/Login.action?phone=\(phone)&validateCode=\(validateCode)"
    }
    
    //获取租车类型
    internal class func GetDateTypeUrl(car_id:Int) -> String {
        
        return "\(host)/Car/Api/GetDateType.action?car_id=\(car_id)"
    }
    
    
    internal class func SerachCarUrl() -> String {
        
        return "\(host)/Car/Api/SerachCar.action"
    }
    
    internal class func getCodeUrl(maxId:Int,count:Int) -> String {
        
        return "\(host)/api/sharecode/list/\(maxId)/\(count)"
    }
    
    internal class func getCodeDetailUrl(codeId:Int) -> String {
        
        return "\(host)/api/sharecode/\(codeId)"
    }
    
    internal class func getBookUrl(type:Int,maxId:Int,count:Int) -> String{
        
        let url="\(host)/api/books/\(type)/\(maxId)/\(count)"
        return url
    }
    
    class func getArticlesUrl(maxId:Int, count:Int) -> String {
        let url="\(host)/api/articles?maxId=\(maxId)&count=\(count)&withContent=1"
        return url
    }
    
    class func getArticlesDetail(articleId:Int) -> String {
        let url="\(host)/api/articles/\(articleId)"
        return url
    }
    
    class func getArticlesShareDetail(articleId:Int) -> String {
        let url="\(host)/articles/\(articleId).html"
        return url
    }
    
    class func getLoginUrl()->String {
        let url = "\(host)/api/user/login"
        return url;
    }
    
    class func getRegistUrl() -> String {
        
        let url = "\(host)/api/user/reg"
        return url;
    }
    class func getTopicCommentUrl() -> String {
        
        let url = "\(host)/api/topic/comment"
        return url;
    }
    
    class func getCreateTopicUrl() -> String {
        
        let url = "\(host)/api/topic/create"
        return url;
    }
}

