//
//  fastCode.swift
//  WWYSwiftDemo
//
//  Created by wangweiyi on 15/12/4.
//  Copyright © 2015年 wangweiyi. All rights reserved.
//

import Foundation
import UIKit

// MARK: 尺寸
let k_SCREEN_W = UIScreen.mainScreen().bounds.size.width
let k_SCREEN_H = UIScreen.mainScreen().bounds.size.height
let k_SCREEN_SCALE = UIScreen.mainScreen().bounds.size.width/320
let k_STATUS_BAR_H = UIApplication.sharedApplication().statusBarFrame.height
let k_TAB_BAR_H : CGFloat = 49.0
let k_NAV_BAR_H : CGFloat = 64.0
// MARK: format
let k_Date_Format = "yyyy'-'MM'-'dd'T'HH':'mm':'ss"
let k_ACCESS_TOKEN = "accesstoken"
let k_STORE_ADMIN = "admin"

// MARK: key window
let k_KEY_WINDOW = UIApplication.sharedApplication().keyWindow
// MARK: 快捷方法
func URL (url : String = "") ->NSURL{
    return (NSURL(string: url))!
}

func IMG (imgName : String) ->UIImage{
    return UIImage(named: imgName)!
}

func UIColorFromRGB(rgbValue: UInt) -> UIColor {
    return UIColor(
        red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
        green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
        blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
        alpha: CGFloat(1.0)
    )
}

func UIColorFromRGBA(rgbValue: UInt,alpha : CGFloat) -> UIColor {
    return UIColor(
        red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
        green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
        blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
        alpha: CGFloat(alpha)
    )
}

func HS_FONT (size:CGFloat) -> UIFont {
    return UIFont.systemFontOfSize(size)
}

func B_FONT (size:CGFloat) -> UIFont {
    return UIFont.boldSystemFontOfSize(size)
}


func ccr(x:CGFloat,y:CGFloat,width:CGFloat,height:CGFloat) ->CGRect{
    return CGRectMake(x, y, width, height)
}

func ccs(width:CGFloat,height:CGFloat) ->CGSize{
    return CGSizeMake(width, height)
}


func ccp(x:CGFloat,y:CGFloat) ->CGPoint{
    return CGPointMake(x, y)
}