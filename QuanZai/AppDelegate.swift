//
//  AppDelegate.swift
//  QuanZai
//
//  Created by i-chou on 6/17/16.
//  Copyright © 2016 i-chou. All rights reserved.
//

import UIKit
import SlideMenuControllerSwift
import SwiftyDrop
import KeychainAccess

let AmapKey = "b2e57bb4e9fa8b688ad1ca4c88e96787"
let WxAppID = "wx0d0aa10360e48ba9"

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var alipay_delegate : AlipayDelegate?

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        
        AMapServices.sharedServices().apiKey = AmapKey
        
        WXApi.registerApp(WxAppID, withDescription: "QuanZai-iOS")
        
        let homeVC = HomeVC()
        let nvc: UINavigationController = UINavigationController(rootViewController: homeVC)
        
        UINavigationBar.appearance().barTintColor = UIColorFromRGB(0x1e2d3f)
        UINavigationBar.appearance().translucent = false
        
        let menuVC = MenuVC()
        menuVC.delegate = homeVC
        
        let slideMenuController =
            SlideMenuController(mainViewController:nvc, leftMenuViewController: menuVC)
        slideMenuController.automaticallyAdjustsScrollViewInsets = true
        slideMenuController.delegate = homeVC

        
        self.window = UIWindow(frame: UIScreen.mainScreen().bounds)
        self.window?.backgroundColor = UIColorFromRGB(0x1e2d3f)
        self.window?.rootViewController = slideMenuController
        self.window?.makeKeyAndVisible()
        return true
    }
    
}

// MARK: - 支付回调用到的代理

extension AppDelegate {
    
    func alipayResult(url: NSURL) {
        
        self.alipay_delegate = PaymentHandler.sharedPaymentHandler()
        
        AlipaySDK.defaultService().processOrderWithPaymentResult(url, standbyCallback: {
            resultDic in
            self.alipay_delegate?.onAlipayResp(resultDic)
        })
    }
    
    func application(application: UIApplication, handleOpenURL url: NSURL) -> Bool {
        
        if url.host == "safepay" {
            self.alipayResult(url)
        }
        if url.host == "platformId=wechat" {
            return WXApi.handleOpenURL(url, delegate: PaymentHandler.sharedPaymentHandler())
        }
        return true
    }
    
    func application(application: UIApplication, openURL url: NSURL, sourceApplication: String?, annotation: AnyObject) -> Bool {
        if url.host == "safepay" {
            self.alipayResult(url)
        }
        if url.host == "platformId=wechat" || url.host == "pay" {
            return WXApi.handleOpenURL(url, delegate: PaymentHandler.sharedPaymentHandler())
        }
        return true
    }
}

// MARK: - 还没用到的代理

extension AppDelegate {
 
    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }
    
    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }
    
    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }
    
    func applicationDidBecomeActive(application: UIApplication) {
        
        //登录24小时清除token
        let keychain = Keychain(service: service)
        guard keychain[k_Login_Last_Time] == nil || keychain[k_Token] == nil else {
            
            let now: NSTimeInterval = NSDate().timeIntervalSince1970
            if let last = NSTimeInterval(keychain[k_Login_Last_Time]!) {
                print(String(now - last))
                
                if now - last > 60*60*24 && keychain[k_Token] != nil {
                    do {
                        try keychain.removeAll()
                    } catch {
                        print("退出登录失败")
                    }
                }
            }
            return
        }
    }
    
    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
    
}
