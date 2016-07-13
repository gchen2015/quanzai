//
//  AppDelegate.swift
//  QuanZai
//
//  Created by i-chou on 6/17/16.
//  Copyright © 2016 i-chou. All rights reserved.
//

import UIKit
import SlideMenuControllerSwift

let AmapKey = "b2e57bb4e9fa8b688ad1ca4c88e96787"

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        
        AMapServices.sharedServices().apiKey = AmapKey
        
        WXApi.registerApp("wx22a7b4318a2ec245", withDescription: "QuanZai-iOS")
        
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
    
    func application(application: UIApplication, handleOpenURL url: NSURL) -> Bool {
        return WXApi.handleOpenURL(url, delegate: PaymentHandler.sharedPaymentHandler())
    }
    
    func application(application: UIApplication, openURL url: NSURL, sourceApplication: String?, annotation: AnyObject) -> Bool {
        return WXApi.handleOpenURL(url, delegate: PaymentHandler.sharedPaymentHandler())
    }

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
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}
