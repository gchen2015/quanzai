//
//  BaseVC.swift
//  QuanZai
//
//  Created by i-chou on 6/20/16.
//  Copyright © 2016 i-chou. All rights reserved.
//

let service = "com.quanzai.com"
let k_UserID = "user_id"
let k_Token = "token"
let k_phone = "phone"


import ObjectMapper
import KeychainAccess
import Presentr

class BaseVC: UIViewController {
    
    var blurEffectView : UIVisualEffectView!
    var closeBtn : UIButton!
    var alertView : UIView?
    var cancelBlock:((alert: UIAlertController) -> ())?
    var okBlock:((alert: UIAlertController) -> ())?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.whiteColor()
        
        self.navigationController?.navigationBar.barStyle = UIBarStyle.Black
        self.navigationController?.navigationBar.tintColor = UIColor.whiteColor()
        
        blurEffectView = UIVisualEffectView(effect: UIBlurEffect(style: .Dark))
        blurEffectView!.frame = self.view.bounds
        
        self.closeBtn = UIButton(imageName: "", hlImageName: "", onTapBlock: { (closeBtn) in
            self.dismissAlert()
        })
        self.closeBtn!.frame = self.view.bounds
    }
    
    func showLogo(show: Bool) {
        
        if show {
            let logo = UIImageView(image: IMG("title"))
            logo.size = ccs(140, 20)
            self.navigationItem.titleView = logo
        } else {
            self.navigationItem.titleView = nil
        }
        
    }
    
    func showTitle(title: String?) {
        self.navigationItem.titleView = nil
        let dict = [NSFontAttributeName: HS_FONT(18),
                    NSForegroundColorAttributeName: UIColorFromRGB(0xffffff)]
        self.navigationController!.navigationBar.titleTextAttributes = dict
        
        self.title = title
    }
    
    func showLeftBarItem(btn: UIButton) {
        let barItem = UIBarButtonItem(customView: btn)
        self.navigationItem.leftBarButtonItem = barItem
    }
    
    func showRightBarItem(btn: UIButton) {
        let barItem = UIBarButtonItem(customView: btn)
        self.navigationItem.rightBarButtonItem = barItem
    }
    
    func showLoginVC(show: Bool) {
        
        if show {
            LoginVC.sharedInstance.delegate = self
            let nav = UINavigationController(rootViewController: LoginVC.sharedInstance)
            self.navigationController?.presentViewController(nav, animated: true, completion: nil)
        } else {
            LoginVC.sharedInstance.navigationController?.dismissViewControllerAnimated(true, completion: nil)
        }
    }
    func checkHaveLogin() -> Bool {
        let keychain = Keychain(service: service)
        if keychain[k_UserID] == nil {
            self.showLoginVC(true)
            return false
        }
        return true
    }

    func alertPresenter(title: String = "", body: String = "", cancelTitle: String?, okTitle: String?, cancelActionHandler:  ((UIAlertAction) -> Void)?, okActionHandler:  ((UIAlertAction) -> Void)?)  {
        
        let alertControler = UIAlertController(title: title, message: body, preferredStyle: UIAlertControllerStyle.Alert)
        if cancelTitle != nil {
            let cancelAction = UIAlertAction(title: "取消", style: .Cancel, handler:cancelActionHandler)
             alertControler.addAction(cancelAction)
        }
        if okTitle != nil {
            let okAction = UIAlertAction(title: "确定", style: .Destructive, handler: okActionHandler)
            alertControler.addAction(okAction)
        }
        
        self.presentViewController(alertControler, animated: true, completion: nil)
        
//        let presenter = Presentr(presentationType: .Alert)
//        presenter.transitionType = TransitionType.CoverVertical
//        
//        let alertController = Presentr.alertViewController(title: title, body: body)
//        
//        if cancelTitle != nil {
//            let cancelAction = AlertAction(title: "取消", style: .Cancel) { alert in
//                print("CANCEL!!")
//            }
//            alertController.addAction(cancelAction)
//        }
//        if okTitle != nil {
//            let okAction = AlertAction(title: "确定", style: .Destructive) { alert in
//                print("OK!!")
//            }
//             alertController.addAction(okAction)
//        }
//        
//        customPresentViewController(presenter, viewController: alertController, animated: true, completion: nil)
    }
    
    func showAlert(alertView: UIView, showBlur: Bool = true) {
        
        self.alertView = alertView
        
        if showBlur {
            blurEffectView.addSubview(closeBtn)
            self.view.addSubview(blurEffectView!)
            self.alertView = alertView
            self.alertView?.centerX = self.view.centerX
            self.alertView?.centerY = self.view.centerY-100
            self.blurEffectView.addSubview(self.alertView!)
            self.alertView!.alpha = 0
            self.blurEffectView.alpha = 0
            UIView.animateWithDuration(0.3, animations: {
                self.alertView!.alpha = 1
                self.blurEffectView.alpha = 1
            })
        } else {
            self.view.addSubview(self.closeBtn)
            self.alertView?.centerX = self.view.centerX
            self.alertView?.centerY = self.view.centerY-140
            self.view.addSubview(self.alertView!)
            self.alertView!.alpha = 0
            UIView.animateWithDuration(0.3, animations: {
                self.alertView!.alpha = 1
            })
        }
    }
    
    func dismissAlert() {
        
        UIView.animateWithDuration(0.3, animations: {
            self.blurEffectView.alpha = 0
            self.alertView!.alpha = 0
            }) { (finished) in
                self.closeBtn.removeFromSuperview()
                self.blurEffectView.removeFromSuperview()
                self.alertView!.removeFromSuperview()
        }
        
    }
}

// MARK: - LoginVCProtocol

extension BaseVC : LoginVCProtocol {
    
    func loginSuccessed() {
        print("loginSuccessed")
        LoginVC.sharedInstance.navigationController?.dismissViewControllerAnimated(true, completion: nil)
    }
}