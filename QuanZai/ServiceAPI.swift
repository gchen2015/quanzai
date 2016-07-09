//
//  ServiceAPI.swift
//  QuanZai
//
//  Created by i-chou on 6/21/16.
//  Copyright © 2016 i-chou. All rights reserved.
//

class ServiceApi: NSObject {
    
    static var host : String = "http://123.185.175.210:8081/RentCarManage"
    
    class func encodeUrl(url: String) -> String {
        return url.stringByAddingPercentEncodingWithAllowedCharacters(NSCharacterSet.URLQueryAllowedCharacterSet())!
    }
    
    //获取用户信息
    internal class func GetUserInfoUrl(user_id: String) -> String {
        let url = "\(host)/User/Api/GetUserInfo.action?user_id=\(user_id)"
        return self.encodeUrl(url)
    }
    
    //登录
    internal class func loginUrl(phone: String, validateCode: String) -> String {
        
        let url = "\(host)/User/Api/Login.action?phone=\(phone)&validateCode=\(validateCode)"
        return self.encodeUrl(url)
    }
    
    //获取短信验证码
    internal class func GetValidateCodeUrl(phone: String) -> String {
        
        let url = "\(host)/User/Api/GetValidateCode.action?phone=\(phone)"
        return self.encodeUrl(url)
    }

    
    //获取租车类型
    internal class func GetDateTypeUrl(car_id: String) -> String {
        
        let url = "\(host)/Car/Api/GetDateType.action?car_id=\(car_id)"
        return self.encodeUrl(url)
    }
    
    
    //获取车辆详情
    internal class func GetCarInfoUrl(car_id: String) -> String {
        
        let url = "\(host)/Car/Api/GetCarInfo.action?car_id=\(car_id)"
        return self.encodeUrl(url)
    }
    
    
    //搜索车辆
    internal class func SearchCarUrl(lng: String, lat: String, type: String) -> String {
        
        let url = "\(host)/Car/Api/SerachCar.action?lng=\(lng)&lat=\(lat)&type=\(type)"
        return self.encodeUrl(url)
    }
    
    //搜索车场
    internal class func SerachNearStoreUrl(lng: String, lat: String, type: String) -> String {
        
        let url = "\(host)/Car/Api/SerachNearStore.action?lng=\(lng)&lat=\(lat)&type=\(type)"
        return self.encodeUrl(url)
    }
    
    //修改个人信息
    internal class func EditUserInfoUrl(user_id: String,phone: String,gender: String,head_portrait: String) -> String {

        let url = "\(host)/User/Api/EditUserInfo.action?user_id=\(user_id)&phone=\(phone)&gender=\(gender)&head_portrait=\(head_portrait)"
        return self.encodeUrl(url)
    }
    
    //上传图片
    internal class func UploadPictureUrl(type: String) -> String{
        
        let url="\(host)/User/Api/UploadPicture.action?type=\(type)"
        return url
    }
    
    //租车资格验证信息
    internal class func EditValidateInfoUrl(user_id: String, real_name: String, driving_license: String, dirving_picture: String) -> String{
        
        let url="\(host)/User/Api/EditValidateInfo.action?user_id=\(user_id)&real_name=\(real_name)&driving_license=\(driving_license)&dirving_picture=\(dirving_picture)"
        return self.encodeUrl(url)
    }
    
    //获取个人租车验证信息
    internal class func GetUserValidateInfoUrl(user_id: String) -> String {
        let url = "\(host)/User/Api/GetUserValidateInfo.action?user_id=\(user_id)"
        return self.encodeUrl(url)
    }
    
    //下单前租车资格验证
    internal class func UserRentRightValidateUrl(user_id: String) -> String {
        let url = "\(host)/Order/Api/UserRentRightValidate.action?user_id=\(user_id)"
        return self.encodeUrl(url)
    }
    
    //下单前余额验证
    internal class func UserBalanceValidateUrl(user_id: String, car_id: String) -> String {
        let url = "\(host)/Order/Api/UserBalanceValidate.action?user_id=\(user_id)&car_id=\(car_id)"
        return self.encodeUrl(url)
    }
    
    //下单前身份验证
    internal class func UserValidateUrl(phone: String, validateCode: String) -> String {
        let url = "\(host)/User/Api/UserValidate.action?phone=\(phone)&validateCode=\(validateCode)"
        return self.encodeUrl(url)
    }
    
    //下单
    internal class func MakeOrderUrl(user_id: String, car_id: String, date_type_id: String) -> String {
        let url = "\(host)/Order/Api/MakeOrder.action?user_id=\(user_id)&car_id=\(car_id)&date_type_id=\(date_type_id)"
        return self.encodeUrl(url)
    }
    
    //获取订单列表
    internal class func GetOrderListUrl(user_id: String) -> String {
        let url = "\(host)/Order/Api/GetOrderList.action?user_id=\(user_id)"
        return self.encodeUrl(url)
    }
    
    //获取订单详情
    internal class func GetOrderDetailUrl(user_id: String) -> String {
        let url = "\(host)/Order/Api/GetOrderDetail.action?user_id=\(user_id)"
        return self.encodeUrl(url)
    }
    
    //结算
    internal class func OrderPaymentUrl(user_id: String) -> String {
        let url = "\(host)/Payment/Api/OrderPayment.action?user_id=\(user_id)"
        return self.encodeUrl(url)
    }
    
    //车辆操控
    internal class func ControlCarRightUrl(user_id: String, lng: String, lat: String, type: String) -> String {
        let url = "\(host)/User/Api/ControlCarRight.action?user_id=\(user_id)&lng=\(lng)&lat=\(lat)&type=\(type)"
        return self.encodeUrl(url)
    }
    
    //判断车辆是否已到回车车场围栏内
    internal class func ReturnCarAddressConfirmUrl(user_id: String) -> String {
        let url = "\(host)/Order/Api/ReturnCarAddressConfirm.action?user_id=\(user_id)"
        return self.encodeUrl(url)
    }
    
    //还车
    internal class func ReturnCarUrl(user_id: String, car_id: String, store_id: String, order_id: String) -> String {
        let url = "\(host)/Order/Api/ReturnCar.action?user_id=\(user_id)&car_id=\(car_id)&store_id=\(store_id)&order_id=\(order_id)"
        return self.encodeUrl(url)
    }
    
    //账户余额
    internal class func GetUserAccountBalanceUrl(user_id: String) -> String {
        let url = "\(host)/User/Api/GetUserAccountBalance.action?user_id=\(user_id)"
        return self.encodeUrl(url)
    }
    
    //获取用户账户明细信息
    internal class func GetUserAccountDetailUrl(user_id: String) -> String {
        let url = "\(host)/User/Api/GetUserAccountDetail.action?user_id=\(user_id)"
        return self.encodeUrl(url)
    }
}

