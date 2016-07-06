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
    internal class func getUserInfoUrl(user_id:String) -> String {
        
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
    
    //搜索车辆
    internal class func SearchCarUrl(lng:String, lat:String, type:String) -> String {
        
        return "\(host)/Car/Api/SerachCar.action?lng=\(lng)&lat=\(lat)&type=\(type)"
    }
    
    //搜索车场
    internal class func SerachNearStoreUrl(lng:String, lat:String, type:String) -> String {
        
        return "\(host)/Car/Api/SerachNearStore.action?lng=\(lng)&lat=\(lat)&type=\(type)"
    }
    
    //修改个人信息
    internal class func EditUserInfoUrl(user_id:String,phone:String,gender:String,head_portrait:String) -> String {
        print("\(host)/User/Api/EditUserInfo.action?user_id=\(user_id)&phone='\(phone)'&gender='\(gender)'&head_portrait='\(head_portrait)'")
        return "\(host)/User/Api/EditUserInfo.action?user_id=\(user_id)&phone='\(phone)'&gender='\(gender)'&head_portrait='\(head_portrait)'"
    }
    
    //上传图片
    internal class func UploadPicture(type:String) -> String{
        
        let url="\(host)/User/Api/UploadPicture.action?type=\(type)"
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

