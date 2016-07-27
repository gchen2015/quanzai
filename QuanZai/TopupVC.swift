//
//  TopupVC.swift
//  QuanZai
//
//  Created by i-chou on 6/30/16.
//  Copyright © 2016 i-chou. All rights reserved.
//

import KeychainAccess
import ObjectMapper
import SwiftyDrop

class TopupVC: BaseVC {
    
    var infoView : TopupView!
    var money : String? = "100" //默认选中100元充值
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        self.showTitle("充值")
        self.setupUI()
    }
    
    func setupUI() {
        
        let scrollView = UIScrollView(frame: ccr(0, 0, k_SCREEN_W, k_SCREEN_H-k_NAV_BAR_H))
        scrollView.contentSize = ccs(k_SCREEN_W, scrollView.height+100)
        scrollView.delegate = self
        self.view.addSubview(scrollView)
        
        self.infoView = NSBundle.mainBundle().loadNibNamed("TopupView", owner: nil, options: nil).first as! TopupView
        self.infoView.delegate = self
        self.infoView.frame = ccr(10, 20, k_SCREEN_W-20, 380)
        scrollView.addSubview(infoView)
    }
}

enum PaymentType: String {
    case WxPay = "微信"
    case Alipay = "支付宝"
}

extension TopupVC : TopupViewProtocol {
    
    func openWechatPay() {
        guard let user_id = Keychain(service: service)[k_UserID] else {
            self.showLoginVC(true)
            return
        }
        
        //TODO: 测试帐号
        let testuser = "0004"
        let password = "698d51a19d8a121ce581499d7b701668"
        
        if self.infoView.otherMoneyTxt.text?.characters.count > 0 {
            self.money = self.infoView.otherMoneyTxt.text
        }
        guard self.money != nil && Float(self.money!) > 0 else {
            Drop.down("请确认金额")
            return
        }
        let progressHUD = ProgressHUD()
        progressHUD.showInWindow("正在处理...")
        let request = Router.WxGetPayInfo(account: testuser, password: password, totalFee: String(Float(self.money!)!*100))
        APIClient.sharedAPIClient().wxPayRequest(request) { (objc, error, badNetWork) in
            progressHUD.dismiss({
                if error != nil {
                    guard error?.userInfo["retmsg"] == nil else {
                        let errorMsg = error?.userInfo["retmsg"] as! String
                        self.alertPresenter(errorMsg, okTitle: "确定")
                        return
                    }
                    self.alertPresenter(error.debugDescription, okTitle: "确定")
                }
            })
        }
    }
    
    func openAlipay() {
        
        guard let user_id = Keychain(service: service)[k_UserID] else {
            self.showLoginVC(true)
            return
        }
        if self.infoView.otherMoneyTxt.text?.characters.count > 0 {
            self.money = self.infoView.otherMoneyTxt.text
        }
        guard self.money != nil && Float(self.money!) > 0 else {
            Drop.down("请确认金额")
            return
        }
        //TODO: 测试帐号
        let testuser = "0004"
        let password = "698d51a19d8a121ce581499d7b701668"
        
        let progressHUD = ProgressHUD()
        progressHUD.showInWindow("正在处理...")
        let request = Router.AliPayGetPayInfo(account: testuser, password: password, subject: "支付宝充值", body: "支付宝充值", price: self.money!)
        APIClient.sharedAPIClient().aliPayRequest(request) { (objc, error, badNetWork) in
            progressHUD.dismiss({ 
                if objc != nil {
                    let orderStr = objc as! String
                    AlipaySDK.defaultService().payOrder(orderStr, fromScheme: "QuanZai", callback: { resultDic in
                        print("resultDic = \(resultDic)")
                    })
                } else {
                    self.alertPresenter("打开支付宝失败", okTitle: "确定")
                }
            })
        }
    }
    
    func selectedButton(radioButton: DLRadioButton) {
        if self.infoView.otherMoneyTxt.text?.characters.count > 0 {
            if let money = Int(self.infoView.otherMoneyTxt.text!) {
                self.money = String(money)
            }
        } else {
            self.money = radioButton.titleLabel!.text?.stringByReplacingOccurrencesOfString("元", withString: "")
        }
    }

}

// MARK: - UIScrollViewDelegate

extension TopupVC : UIScrollViewDelegate {
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        self.infoView.otherMoneyTxt.endEditing(true)
    }
}

