//
//  ServiceAPI.swift
//  QuanZai
//
//  Created by i-chou on 6/21/16.
//  Copyright © 2016 i-chou. All rights reserved.
//

class ServiceApi: NSObject {
    
    static var host : String = "http://zbcool.com"
    
    internal class func getCategoryUrl() -> String {
        
        return "\(host)/article/categorys"
    }
    
    internal class func getTopicDetail(topicId:Int) -> String {
        
        return "\(host)/api/topic/\(topicId)"
    }
    
    internal class func getTopicShareDetail(topicId:Int) -> String {
        
        return "\(host)/topic/\(topicId).html"
    }
    
    internal class func getCodeShareDetail(codeId:Int) -> String {
        
        return "\(host)/code4swift/\(codeId).html"
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

